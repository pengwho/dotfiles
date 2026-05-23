# dotfiles

跨平台終端機環境設定，適用於 macOS / Linux。
包含 Starship 提示字元、tmux、zsh plugins。

## 環境需求

- zsh
- git
- curl

## 安裝

```bash
git clone git@github.com:pengwho/dotfiles.git ~/dotfiles
~/dotfiles/install.sh
exec zsh
```

## 檔案說明

| 檔案 | 說明 |
|---|---|
| `install.sh` | 一鍵安裝腳本 |
| `.zshrc` | zsh 設定，載入 plugins 和 Starship |
| `starship.toml` | Starship 提示字元設定 |
| `.tmux.conf` | tmux 顏色與狀態列設定 |

## install.sh 做了什麼

1. 安裝 Starship（若尚未安裝）
2. 建立 symlink：`starship.toml` → `~/.config/starship.toml`
3. 建立 symlink：`.tmux.conf` → `~/.tmux.conf`
4. 建立 symlink：`.zshrc` → `~/.zshrc`
5. 安裝 zsh plugins：
   - `zsh-autosuggestions`（輸入建議）
   - `zsh-syntax-highlighting`（語法顏色）
   - `zsh-z`（快速跳目錄）

## 新機器 SSH 連 GitHub 設定

```bash
# 產生金鑰
ssh-keygen -t ed25519 -C "機器名稱"

# 複製公鑰
cat ~/.ssh/id_ed25519.pub

# 貼到 GitHub
# https://github.com/settings/ssh/new

# 測試
ssh -T git@github.com

# 把 remote 改成 SSH
git remote set-url origin git@github.com:pengwho/dotfiles.git
```

## 更新設定

```bash
# 修改設定後同步
cd ~/dotfiles
git add .
git commit -m "update: 說明"
git push

# 其他機器拉取
cd ~/dotfiles
git pull
exec zsh
```

## 注意事項

- 不依賴 Oh My Zsh，避免與 Starship 衝突
- Starship 設定中 `show_always = true` 讓使用者名稱永遠顯示
- 字體使用 emoji，不需要安裝 Nerd Font
- tmux 如果顏色異常，exit 後重新開啟即可
