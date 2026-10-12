#!/usr/bin/env bash
# 校验 skills/、marketplace.json、README Skills 列表三者一致，并拒绝明显空壳 skill。
# 用法：./scripts/check-consistency.sh
set -euo pipefail

repo_dir="$(cd "$(dirname "$0")/.." && pwd)"
cd "$repo_dir"

errors=0
warn() { echo "WARN: $*" >&2; }
fail() { echo "FAIL: $*" >&2; errors=$((errors + 1)); }

# --- disk skills ---
mapfile -t disk_skills < <(find skills -mindepth 1 -maxdepth 1 -type d -printf '%f\n' | sort)

# --- marketplace skills ---
mp_file=".claude-plugin/marketplace.json"
if [[ ! -f "$mp_file" ]]; then
  fail "缺少 $mp_file"
  mp_skills=()
else
  mapfile -t mp_skills < <(python3 - <<'PY'
import json
from pathlib import Path
data = json.loads(Path(".claude-plugin/marketplace.json").read_text())
names = []
for plug in data.get("plugins", []):
    for s in plug.get("skills", []):
        # "./skills/foo" -> foo
        names.append(Path(s).name)
print("\n".join(sorted(set(names))))
PY
)
fi

# --- README Skills 列表（## Skills 列表 … 到下一个 ## 或 **版权）---
mapfile -t readme_skills < <(python3 - <<'PY'
import re
from pathlib import Path
text = Path("README.md").read_text(encoding="utf-8")
m = re.search(r"## Skills 列表\n(.*?)(?=\n## |\n\*\*版权)", text, re.S)
if not m:
    raise SystemExit("README missing Skills 列表 section")
section = m.group(1)
# only skill names in backticks that look like skill ids
names = re.findall(r"`([a-z0-9][a-z0-9-]*)`", section)
# filter noise words that aren't skills
noise = {"license", "grill-me"}  # grill-me is a skill; keep it
# keep all kebab-case matches; drop pure words if any
# Also appear: /grill-me in prose — already backtick grill-me
uniq = sorted(set(names))
print("\n".join(uniq))
PY
)

set_eq() {
  local -n a=$1 b=$2
  local x
  declare -A A=() B=()
  for x in "${a[@]}"; do A["$x"]=1; done
  for x in "${b[@]}"; do B["$x"]=1; done
  for x in "${!A[@]}"; do [[ -n "${B[$x]+x}" ]] || echo "only_left:$x"; done
  for x in "${!B[@]}"; do [[ -n "${A[$x]+x}" ]] || echo "only_right:$x"; done
}

echo "== disk (${#disk_skills[@]}) vs marketplace (${#mp_skills[@]}) =="
while IFS= read -r line; do
  case "$line" in
    only_left:*) fail "在 skills/ 但不在 marketplace.json: ${line#only_left:}" ;;
    only_right:*) fail "在 marketplace.json 但不在 skills/: ${line#only_right:}" ;;
  esac
done < <(set_eq disk_skills mp_skills)

echo "== disk vs README Skills 列表 (${#readme_skills[@]}) =="
while IFS= read -r line; do
  case "$line" in
    only_left:*) fail "在 skills/ 但不在 README Skills 列表: ${line#only_left:}" ;;
    only_right:*) fail "在 README Skills 列表但不在 skills/: ${line#only_right:}" ;;
  esac
done < <(set_eq disk_skills readme_skills)

# --- per-skill structure ---
# grill-me is an intentional short dispatcher to grilling
ALLOW_SHORT=(grill-me)

is_allow_short() {
  local n="$1" a
  for a in "${ALLOW_SHORT[@]}"; do [[ "$n" == "$a" ]] && return 0; done
  return 1
}

body_len() {
  python3 - "$1" <<'PY'
import re, sys
from pathlib import Path
text = Path(sys.argv[1]).read_text(encoding="utf-8")
# strip YAML frontmatter
if text.startswith("---"):
    parts = text.split("---", 2)
    body = parts[2] if len(parts) >= 3 else text
else:
    body = text
body = body.strip()
print(len(body))
print(body[:80].replace("\n", " "))
PY
}

for name in "${disk_skills[@]}"; do
  skill_md="skills/$name/SKILL.md"
  if [[ ! -f "$skill_md" ]]; then
    fail "缺少 $skill_md"
    continue
  fi
  # frontmatter name
  fm_name=$(python3 - "$skill_md" "$name" <<'PY'
import re, sys
from pathlib import Path
text = Path(sys.argv[1]).read_text(encoding="utf-8")
expect = sys.argv[2]
m = re.match(r"---\n(.*?)\n---", text, re.S)
if not m:
    print("NO_FRONTMATTER")
    raise SystemExit
fm = m.group(1)
nm = re.search(r"^name:\s*[\"']?([^\"'\n]+)", fm, re.M)
print(nm.group(1).strip() if nm else "NO_NAME")
PY
)
  if [[ "$fm_name" == "NO_FRONTMATTER" ]]; then
    fail "$name: SKILL.md 缺少 YAML frontmatter"
  elif [[ "$fm_name" == "NO_NAME" ]]; then
    fail "$name: frontmatter 缺少 name"
  elif [[ "$fm_name" != "$name" ]]; then
    fail "$name: frontmatter name='$fm_name' 与目录名不一致"
  fi

  mapfile -t bl < <(body_len "$skill_md")
  blen="${bl[0]}"
  bpreview="${bl[1]:-}"
  if is_allow_short "$name"; then
    if [[ "$blen" -lt 10 ]]; then
      fail "$name: 即便是短入口，正文也过短 (${blen} chars)"
    fi
  else
    # stub heuristics
    if [[ "$blen" -lt 120 ]]; then
      fail "$name: 疑似空壳/stub（正文仅 ${blen} chars）: ${bpreview}"
    fi
    if echo "$bpreview" | grep -qiE 'TODO|TBD|placeholder|coming soon|待补充'; then
      fail "$name: 正文含占位标记"
    fi
  fi

  # LICENSE optional warn
  if ! compgen -G "skills/$name/LICENSE*" > /dev/null; then
    warn "$name: 无 LICENSE* 文件"
  fi
done

# marketplace paths resolve
python3 - <<'PY' || fail "marketplace 路径校验脚本异常"
import json, sys
from pathlib import Path
data = json.loads(Path(".claude-plugin/marketplace.json").read_text())
bad = False
for plug in data.get("plugins", []):
    for s in plug.get("skills", []):
        path = Path(s)
        if not path.is_dir():
            print(f"FAIL: marketplace 路径不存在: {s} (plugin={plug.get('name')})", file=sys.stderr)
            bad = True
        elif not (path / "SKILL.md").is_file():
            print(f"FAIL: marketplace 指向的目录无 SKILL.md: {s}", file=sys.stderr)
            bad = True
sys.exit(1 if bad else 0)
PY

if [[ "$errors" -gt 0 ]]; then
  echo ""
  echo "一致性检查失败：$errors 项" >&2
  exit 1
fi
echo ""
echo "一致性检查通过：${#disk_skills[@]} skills，与 marketplace / README 对齐，无空壳。"
