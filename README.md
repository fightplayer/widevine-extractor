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
```

### 任意の場所に直接配置する場合

引数に配置先のパスを指定できます（`bash -s --` の後ろにパスを記述）。

```bash
curl -sSL https://raw.githubusercontent.com/fightplayer/widevine-extractor/main/widevine-extractor.sh | bash -s -- /path/to/destination/WidevineCdm
```

---

## 免責事項 (Disclaimer)

- Widevine は Google LLC の商標です。
- 本リポジトリは非公式のスクリプトであり、Google のバイナリを直接再配布するものではありません。
