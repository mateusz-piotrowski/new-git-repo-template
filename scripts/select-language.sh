#!/usr/bin/env bash
# Choose a programming language and add its ignore rules to .gitignore.
# Usage: scripts/select-language.sh [language-number-or-name]
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
GITIGNORE="$ROOT/.gitignore"
BEGIN="# >>> language: "
END="# <<< language"

LANGUAGES=(JavaScript TypeScript Python Java Go Rust "C++" "C#" PHP Ruby)

rules_for() {
  case "$1" in
    JavaScript|TypeScript) printf '%s\n' "node_modules/" "dist/" "build/" "coverage/" "*.tsbuildinfo" ".npm/" "yarn-error.log*" ;;
    Python) printf '%s\n' "__pycache__/" "*.py[cod]" ".venv/" "venv/" "*.egg-info/" "dist/" "build/" ".pytest_cache/" ".mypy_cache/" ".ruff_cache/" ".coverage" ;;
    Java) printf '%s\n' "*.class" "*.jar" "*.war" "target/" "build/" ".gradle/" ".idea/" "*.iml" ;;
    Go) printf '%s\n' "*.exe" "*.test" "*.out" "bin/" "vendor/" "go.work" ;;
    Rust) printf '%s\n' "target/" "**/*.rs.bk" ;;
    "C++") printf '%s\n' "*.o" "*.obj" "*.a" "*.so" "*.dylib" "*.dll" "*.exe" "build/" "cmake-build-*/" "CMakeCache.txt" "CMakeFiles/" ;;
    "C#") printf '%s\n' "bin/" "obj/" "*.user" "*.suo" ".vs/" "packages/" "*.nupkg" ;;
    PHP) printf '%s\n' "vendor/" "composer.phar" ".phpunit.result.cache" ;;
    Ruby) printf '%s\n' "*.gem" ".bundle/" "vendor/bundle/" "log/" "tmp/" "coverage/" ".byebug_history" ;;
  esac
}

choice="${1:-}"
if [[ -z "$choice" ]]; then
  echo "Select a programming language:"
  for i in "${!LANGUAGES[@]}"; do
    printf '  %2d) %s\n' "$((i + 1))" "${LANGUAGES[$i]}"
  done
  read -r -p "Enter number or name: " choice
fi

language=""
if [[ "$choice" =~ ^[0-9]+$ ]] && ((choice >= 1 && choice <= ${#LANGUAGES[@]})); then
  language="${LANGUAGES[$((choice - 1))]}"
else
  for l in "${LANGUAGES[@]}"; do
    if [[ "${l,,}" == "${choice,,}" ]]; then language="$l"; fi
  done
fi
if [[ -z "$language" ]]; then
  echo "Invalid selection: '$choice'" >&2
  exit 1
fi

touch "$GITIGNORE"
tmp="$(mktemp)"
trap 'rm -f "$tmp"' EXIT

# Drop any previously generated language block, then append the new one.
awk -v b="$BEGIN" -v e="$END" '
  index($0, b) == 1 { skip = 1 }
  !skip { print }
  index($0, e) == 1 { skip = 0 }
' "$GITIGNORE" > "$tmp"
# Remove trailing blank lines left behind.
sed -i -e :a -e '/^\n*$/{$d;N;ba' -e '}' "$tmp"

{
  cat "$tmp"
  [[ -s "$tmp" ]] && echo
  echo "${BEGIN}${language}"
  rules_for "$language"
  echo "$END"
} > "$GITIGNORE"

echo "Added $language rules to .gitignore"
