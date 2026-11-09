#!/usr/bin/env bash
# Installs Whisper small.en (faster-whisper / CTranslate2 format) into the Hugging Face cache,
# so faster_whisper.WhisperModel('small.en') loads it offline. Use when huggingface.co is blocked.
# Run from the repo root:  bash install.sh   then run Whisper with  HF_HUB_OFFLINE=1
set -euo pipefail
cd "$(dirname "$0")"
DEST="$HOME/.cache/huggingface/hub/models--Systran--faster-whisper-small.en"
mkdir -p "$DEST/snapshots/local" "$DEST/refs"
printf 'local' > "$DEST/refs/main"
cat model/model.bin.part* > "$DEST/snapshots/local/model.bin"
cp model/config.json model/tokenizer.json model/vocabulary.txt "$DEST/snapshots/local/"
want=$(cut -d' ' -f1 model/model.bin.sha256)
got=$(sha256sum "$DEST/snapshots/local/model.bin" | cut -d' ' -f1)
if [ "$want" != "$got" ]; then echo "CHECKSUM MISMATCH: $got (expected $want)"; exit 1; fi
echo "Whisper small.en installed at $DEST (checksum OK). Run Whisper with HF_HUB_OFFLINE=1."
