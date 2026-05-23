#!/bin/bash

DOTFILES="$HOME/dotfiles"

echo "🚀 開始安裝 dotfiles..."

# 1. 安裝 Starship
if ! command -v starship &> /dev/null; then
    echo "📦 安裝 Starship..."
    curl -sS https://starship.rs/install.sh | sh
fi

# 2. 建立設定目錄
mkdir -p ~/.config
mkdir -p ~/.zsh

# 3. Starship 設定
ln -sf "$DOTFILES/starship.toml" ~/.config/starship.toml
echo "✅ Starship 設定完成"

# 4. tmux 設定
ln -sf "$DOTFILES/.tmux.conf" ~/.tmux.conf
echo "✅ tmux 設定完成"

# 5. zshrc 設定
ln -sf "$DOTFILES/.zshrc" ~/.zshrc
echo "✅ .zshrc 設定完成"

# 6. 安裝 zsh plugins
if [ ! -d ~/.zsh/zsh-autosuggestions ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
fi
if [ ! -d ~/.zsh/zsh-syntax-highlighting ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting
fi
if [ ! -d ~/.zsh/zsh-z ]; then
    git clone https://github.com/agkozak/zsh-z ~/.zsh/zsh-z
fi
echo "✅ Plugins 安裝完成"

echo "🎉 全部完成！請執行 exec zsh"
