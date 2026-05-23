# dotfiles

跨平台終端機環境設定，適用於 macOS / Linux。
包含 Starship 提示字元、tmux、zsh plugins。

## 一鍵安裝

```bash
git clone https://github.com/pengwho/dotfiles.git ~/dotfiles && ~/dotfiles/install.sh && exec zsh
```

## 安裝完成後包含

- Starship 提示字元（顯示目錄、git 狀態、執行時間）
- zsh-autosuggestions（輸入建議）
- zsh-syntax-highlighting（語法顏色）
- zsh-z（快速跳目錄，例如 `z dotfiles`）
- tmux 主題

## 新機器連接 GitHub（可選）

如果需要推送到 GitHub，設定 SSH 金鑰：

```bash
ssh-keygen -t ed25519 -C "機器名稱"
cat ~/.ssh/id_ed25519.pub
```

將公鑰貼到 https://github.com/settings/ssh/new

## 注意事項

- 不需要安裝字體
- 若原本有 Oh My Zsh，建議先移除再安裝
- tmux 顏色異常時，`exit` 後重新開啟即可
