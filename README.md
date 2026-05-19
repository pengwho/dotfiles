# dotfiles

跨平台終端機環境設定，適用於 macOS / Linux / Windows (WSL)。

包含 Starship 提示字元主題與 tmux 設定，SSH 連線到任何機器都能保持一致的外觀。

---

## 包含的設定檔

| 檔案 | 說明 |
|---|---|
| `starship.toml` | Starship 提示字元主題設定 |
| `.tmux.conf` | tmux 顏色與狀態列設定 |
| `install.sh` | 自動安裝腳本 |

---

## 新機器安裝 SOP

### Step 1：安裝 Starship

\`\`\`bash
curl -sS https://starship.rs/install.sh | sh
\`\`\`

### Step 2：Clone 這個 repo

\`\`\`bash
git clone git@github.com:pengwho/dotfiles.git ~/dotfiles
\`\`\`

### Step 3：執行安裝腳本

\`\`\`bash
~/dotfiles/install.sh
\`\`\`

### Step 4：重新載入 shell

\`\`\`bash
source ~/.zshrc   # zsh
source ~/.bashrc  # bash
\`\`\`

---

## 手動安裝

### Starship

\`\`\`bash
mkdir -p ~/.config
ln -sf ~/dotfiles/starship.toml ~/.config/starship.toml
echo 'eval "\$(starship init zsh)"' >> ~/.zshrc
source ~/.zshrc
\`\`\`

### tmux

\`\`\`bash
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
tmux source-file ~/.tmux.conf
\`\`\`

---

## SSH 連接 GitHub 設定

### 產生金鑰

\`\`\`bash
ssh-keygen -t ed25519 -C "你的機器名稱"
\`\`\`

### 複製公鑰

\`\`\`bash
cat ~/.ssh/id_ed25519.pub
\`\`\`

前往 https://github.com/settings/ssh/new 貼上公鑰並儲存。

### 測試連線

\`\`\`bash
ssh -T git@github.com
\`\`\`

---

## 更新設定

\`\`\`bash
cd ~/dotfiles
git add .
git commit -m "update: 說明修改內容"
git push
\`\`\`

其他機器拉取：

\`\`\`bash
cd ~/dotfiles
git pull
\`\`\`

---

## 常見問題

**Q：提示字元出現亂碼？**
執行 \`starship preset no-nerd-font -o ~/.config/starship.toml\` 改用無字體版本。

**Q：tmux 顏色跑掉？**
先 \`exit\` 退出，再 \`tmux\` 重新進入。

**Q：install.sh 沒有執行權限？**
\`\`\`bash
chmod +x ~/dotfiles/install.sh
\`\`\`
