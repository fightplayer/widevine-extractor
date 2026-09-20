# widevine-extractor

Google Chrome 公式パッケージ（deb）から、DRM再生に必要な Widevine CDM だけをコピーするスクリプトです。

Helium Browser などの Chromium 派生ブラウザで、DMM TV などを再生可能にする際に便利です。

---

## 特徴

- **Chrome本体のインストール不要**: 公式debから `WidevineCdm` のみを取得します。
- **高速・省容量**: パッケージ全体を展開しないため、無駄なディスク書き込みを行いません。
- **ポータブル**: Debian系だけでなく、Arch Linux、Fedora などでも動作します。

---

## 前提条件

- Linux `x86_64` (amd64)
- `curl`, `tar`, `xz`, `binutils` (ar)

---

## 使い方

### カレントディレクトリに抽出（今いる場所に `./WidevineCdm` を作成）

```bash
curl -sSL https://raw.githubusercontent.com/fightplayer/widevine-extractor/main/widevine-extractor.sh | bash
