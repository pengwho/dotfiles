#!/bin/bash

DOTFILES="$HOME/dotfiles"

echo "🚀 開始安裝 dotfiles..."

# 建立 .config 資料夾
mkdir -p ~/.config

# Starship
ln -sf "$DOTFILES/starship.toml" ~/.config/starship.toml
echo "✅ Starship 設定完成"

# tmux
ln -sf "$DOTFILES/.tmux.conf" ~/.tmux.conf
echo "✅ tmux 設定完成"

# 安裝 Starship（若尚未安裝）
if ! command -v starship &> /dev/null; then
    echo "📦 安裝 Starship..."
    curl -sS https://starship.rs/install.sh | sh
fi

# 加入 starship 啟動（若 .zshrc 裡還沒有）
if ! grep -q "starship init" ~/.zshrc; then
    echo 'eval "$(starship init zsh)"' >> ~/.zshrc
    echo "✅ .zshrc 設定完成"
fi

echo "🎉 全部完成！請執行 source ~/.zshrc"
