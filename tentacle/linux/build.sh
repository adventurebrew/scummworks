#!/usr/bin/env bash
# Day of the Tentacle — Linux build (mirrors tentacle/build.bat). Run from anywhere.
set -euo pipefail

die() {
  printf '%s\n' "error: $*" >&2
  exit 1
}

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" && pwd)"
GAME_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
REPO_ROOT="$(cd "$GAME_ROOT/.." && pwd)"
cd "$GAME_ROOT"

if [[ "${VERBOSE:-0}" == 1 ]]; then
  printf 'GAME_ROOT=%s\n' "$GAME_ROOT" >&2
  printf 'REPO_ROOT=%s\n' "$REPO_ROOT" >&2
fi

if [[ -n "${NUTCRACKER:-}" ]]; then
  NUTCRACKER_CMD="$NUTCRACKER"
  [[ -x "$NUTCRACKER_CMD" ]] || die "NUTCRACKER is set but not executable: $NUTCRACKER_CMD"
else
  command -v nutcracker &>/dev/null || die "nutcracker not found on PATH; install it or set NUTCRACKER=/path/to/nutcracker"
  NUTCRACKER_CMD="nutcracker"
fi

command -v md5deep &>/dev/null || die "md5deep not found; install the md5deep package for your distribution"

[[ -f strings.txt ]] || die "strings.txt missing in $GAME_ROOT"
[[ -f orig/TENTACLE.000 ]] || die "orig/TENTACLE.000 missing (place game data under orig/)"
[[ -d userdata ]] || die "userdata/ directory missing (required for nutcracker sputm build)"

# Optional scummtr inject (disabled in build.bat):
# "$REPO_ROOT/utils/scummtr" -w -g tentacle -if strings.txt -p .

"$NUTCRACKER_CMD" sputm build --ref orig/TENTACLE.000 userdata/TENTACLE
"$NUTCRACKER_CMD" sputm strings_inject -t strings.txt TENTACLE.000

md5deep -bz TENTACLE.000 > hash.txt
md5deep -bz TENTACLE.001 >> hash.txt
