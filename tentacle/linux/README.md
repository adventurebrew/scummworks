# Day of the Tentacle — Linux build

Shell workflows for **Day of the Tentacle** under [`tentacle/`](../): they mirror the Windows batch files at the `tentacle/` root and expect the same layout.

## Windows (unchanged)

Use [`../build.bat`](../build.bat) and [`../dump.bat`](../dump.bat) from `tentacle/` on Windows. This directory does not replace those files.

## Layout

All paths are relative to **`tentacle/`** (parent of `linux/`):

| Path | Role |
|------|------|
| [`../strings.txt`](../strings.txt) | String table for injection |
| [`../orig/`](../orig/) | Your local copy of original game data (`orig/TENTACLE.000`, …) — **not in git** |
| `userdata/` | Input for `nutcracker sputm build` (must exist; contents depend on your nutcracker version) |
| `../hash.txt` | Checksums of built `TENTACLE.000` / `.001` (tracked in git) |

## Prerequisites

- **bash** (not plain `sh`; scripts use `set -o pipefail`)
- **nutcracker** on `PATH`, or set **`NUTCRACKER=/absolute/path/to/nutcracker`** (e.g. `~/.local/bin/nutcracker`). Upstream: [BLooperZ/nutcracker](https://github.com/BLooperZ/nutcracker), also on [PyPI](https://pypi.org/project/nutcracker/).
- **md5deep** for `hash.txt` in the same format as Windows `md5deep64 -bz`. Install the **`md5deep`** package with your distro’s package manager. Examples:
  - Debian / Ubuntu: `sudo apt install md5deep`
  - RPM-based (dnf/yum): `sudo dnf install md5deep` or `sudo yum install md5deep`
  - Arch: `sudo pacman -S md5deep`
  - Immutable or minimal images: use your image’s package tool, or install inside **toolbox** / **distrobox** (or similar).
- **dump only:** **scummtr** at `<repo>/utils/scummtr` (sibling of `tentacle/`), or set **`SCUMMTR=/path/to/scummtr`**. The repo does not ship `utils/`; mirror the Windows layout (`..\utils\scummtr` from `tentacle/`).

## How to run

From **`tentacle/`**:

```bash
./linux/build.sh
./linux/dump.sh
```

From the **repository root**:

```bash
bash tentacle/linux/build.sh
bash tentacle/linux/dump.sh
```

Scripts change into `tentacle/` themselves; you do not need to `cd` first.

If you get “Permission denied”, run `chmod +x tentacle/linux/*.sh` or use `bash tentacle/linux/build.sh`.

Debug paths:

```bash
VERBOSE=1 ./linux/build.sh
```

## Game data and copyright

`orig/` contains **copyrighted game files**. It is **gitignored** and must not be committed. Obtain and copy game data legally; the translation repo does not distribute it.

## Encoding

Per [`.gitattributes`](../../.gitattributes), `strings*.txt` use **cp1255** in git. When editing [`../strings.txt`](../strings.txt), keep that encoding so Hebrew text is not corrupted.

## `hash.txt` policy

[`../hash.txt`](../hash.txt) is a **project artifact** in version control. A successful **build** overwrites it (and `TENTACLE.000` / `TENTACLE.001`). Commit a new `hash.txt` only when the team intends to record updated golden checksums (e.g. after translation or toolchain changes), not from accidental local builds with the wrong `orig/` / `userdata/`.

## Warnings

- **Overwrites:** `build.sh` replaces `TENTACLE.000`, `TENTACLE.001`, and `hash.txt` under `tentacle/`. Back up anything you care about before building.
- **Case sensitivity:** Linux filesystems are usually case-sensitive. Paths must match exactly (e.g. `orig/TENTACLE.000`).
- **userdata layout:** If `nutcracker sputm build` fails, compare your tree with a known-good setup or your nutcracker documentation; preflight only checks that `userdata/` exists.

## Troubleshooting

| Symptom | What to check |
|---------|----------------|
| `nutcracker not found` | `PATH`, or set `NUTCRACKER` to the executable |
| `md5deep not found` | Install the `md5deep` package for your distro |
| `userdata/ directory missing` | Create/populate `userdata/` as required by nutcracker |
| `scummtr not found` | `utils/scummtr` next to `tentacle/`, or `SCUMMTR` |
| Works on Windows but not Linux | Filename case under `orig/` |
| Different `hash.txt` vs Windows | Different nutcracker / md5deep versions or `strings.txt` line endings |
