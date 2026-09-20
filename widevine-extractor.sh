#!/usr/bin/env bash
set -euo pipefail

# 配置先（引数がなければカレントディレクトリの ./WidevineCdm）
TARGET_DIR="${1:-./WidevineCdm}"
echo "==> 現在の場所（$(pwd)）に WidevineCdm を作成/更新します..."
echo "==> 配置先: $TARGET_DIR"

# アーキテクチャ確認 (Chromeのdebはamd64のみ)
if [ "$(uname -m)" != "x86_64" ]; then
  echo "==> エラー: x86_64 (amd64) 環境のみ対応しています。" >&2
  exit 1
fi

# 依存ツールの確認
for cmd in curl ar tar xz; do
  if ! command -v "$cmd" &>/dev/null; then
    echo "==> エラー: 必要なツール '$cmd' が見つかりません。" >&2
    exit 1
  fi
done

# 一時ディレクトリ作成と trap による自動クリーンアップ
TMP_DIR=$(mktemp -d)
trap 'rm -rf "$TMP_DIR"' EXIT

echo "==> Google Chrome（amd64版）をダウンロード中..."
curl -sSL "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb" -o "$TMP_DIR/chrome.deb"

echo "==> WidevineCdm のみをピンポイント展開中..."
# 全体を展開せず、WidevineCdm だけを直接抽出（高速＆省容量）
ar p "$TMP_DIR/chrome.deb" data.tar.xz | tar -xJ -C "$TMP_DIR" ./opt/google/chrome/WidevineCdm

EXTRACTED_CDM="$TMP_DIR/opt/google/chrome/WidevineCdm"
if [ ! -d "$EXTRACTED_CDM" ]; then
  echo "==> エラー: WidevineCdm の抽出に失敗しました。" >&2
  exit 1
fi

echo "==> WidevineCdm を配置中..."
rm -rf "$TARGET_DIR"
cp -r "$EXTRACTED_CDM" "$TARGET_DIR"

# バージョン取得と確認
VERSION=$(grep -oP '"version":\s*"\K[^"]+' "$TARGET_DIR/manifest.json" 2>/dev/null || echo "不明")
echo "==> 完了しました！ WidevineCdm バージョン: $VERSION"
ls -la "$TARGET_DIR"
