#!/usr/bin/env bash
set -euo pipefail

ASSET_DIR="theme/assets/images/logo"
ASSET_PATH="$ASSET_DIR/data-guy-character.png"
FILE_ID="1gKSTdMQplTzGMG56zANpU3OZvhALUJta"

mkdir -p "$ASSET_DIR"
python -m pip install --disable-pip-version-check --quiet gdown
python -m gdown --id "$FILE_ID" -O "$ASSET_PATH"

python - <<'PY'
from pathlib import Path

path = Path("theme/assets/images/logo/data-guy-character.png")
data = path.read_bytes()

if len(data) < 10_000:
    raise SystemExit(f"Mascot download is unexpectedly small: {len(data)} bytes")

if data[:8] != b"\x89PNG\r\n\x1a\n":
    raise SystemExit("Downloaded mascot is not a valid PNG")

print(f"Mascot ready: {path} ({len(data)} bytes)")
PY
