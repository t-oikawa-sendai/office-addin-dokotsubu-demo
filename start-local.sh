#!/usr/bin/env bash
#
# ソース名: start-local.sh
# Lang: Shell
# Function: このディレクトリをルートに python3 でポート 3000 の静的サーバーを起動
# Note: manifest.local.xml の URL と一致。停止は Ctrl+C。
# Author:Takashi Oikawa
# Date:2026/04/04
# LastUp:2026/04/04
#
set -euo pipefail
cd "$(dirname "$0")"
echo "Serving http://localhost:3000/ (Ctrl+C to stop)"
exec python3 -m http.server 3000
