#!/usr/bin/env bash
# Day of the Tentacle — Linux extract/dump (mirrors tentacle/dump.bat). Run from anywhere.
set -euo pipefail

die() {
  printf '%s\n' "error: $*" >&2
  exit 1
}

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" && pwd)"
GAME_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
REPO_ROOT="$(cd "$GAME_ROOT/.." && pwd)"
cd "$GAME_ROOT"

SCUMMTR="${SCUMMTR:-$REPO_ROOT/utils/scummtr}"

if [[ "${VERBOSE:-0}" == 1 ]]; then
  printf 'GAME_ROOT=%s\n' "$GAME_ROOT" >&2
  printf 'REPO_ROOT=%s\n' "$REPO_ROOT" >&2
  printf 'SCUMMTR=%s\n' "$SCUMMTR" >&2
fi

if [[ -n "${NUTCRACKER:-}" ]]; then
  NUTCRACKER_CMD="$NUTCRACKER"
  [[ -x "$NUTCRACKER_CMD" ]] || die "NUTCRACKER is set but not executable: $NUTCRACKER_CMD"
else
  command -v nutcracker &>/dev/null || die "nutcracker not found on PATH; install it or set NUTCRACKER=/path/to/nutcracker"
  NUTCRACKER_CMD="nutcracker"
fi

[[ -f orig/TENTACLE.000 ]] || die "orig/TENTACLE.000 missing (place game data under orig/)"
[[ -e "$SCUMMTR" ]] || die "scummtr not found at $SCUMMTR (set SCUMMTR=/path/to/scummtr or place binary at <repo>/utils/scummtr)"
[[ -x "$SCUMMTR" ]] || die "scummtr is not executable: $SCUMMTR"

"$NUTCRACKER_CMD" sputm strings_extract -t orig.txt orig/TENTACLE.000
"$SCUMMTR" -w -g tentacle -oHf origtr.txt -p orig
