#!/usr/bin/env bash
#
# ソース名: start-local.command
# Lang: Shell
# Function: Finder からダブルクリックでローカル静的サーバー（ポート 3000）を起動
# Note: ゲートキー時は右クリック→開く。start-local.sh を呼び出す。
# Author:Takashi Oikawa
# Date:2026/04/04
# LastUp:2026/04/04
#
cd "$(dirname "$0")"
exec bash ./start-local.sh
