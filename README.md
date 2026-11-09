# whisper-small-en

A copy of OpenAI Whisper `small.en`, converted to the faster-whisper / CTranslate2 format
(from `Systran/faster-whisper-small.en`, MIT license), for environments where huggingface.co is blocked.

It's used by the faceless-shorts video tool for word-timed captions.

## Install

```bash
git clone --depth 1 https://github.com/gauravraul/whisper-small-en
bash whisper-small-en/install.sh
```

Then load it offline:

```bash
HF_HUB_OFFLINE=1 python -c "from faster_whisper import WhisperModel; WhisperModel('small.en', device='cpu', compute_type='int8')"
```

`model.bin` is split into pieces under 100 MB (GitHub's per-file limit). `install.sh` joins them
and checks the SHA-256.

## License

Whisper by OpenAI, MIT license. Conversion by Systran (faster-whisper), MIT license.
