setopt promptsubst
# Plugins
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-z/zsh-z.plugin.zsh

# 按 Tab 接受自動建議
bindkey '^I' autosuggest-accept

# PATH
export PATH="$HOME/.local/bin:/usr/local/bin:$PATH"

# Aliases
alias python='python3'
alias pip='pip3'


# Tab 補全設定
bindkey '^[[Z' reverse-menu-complete
autoload -Uz compinit && compinit
bindkey '^I' menu-complete

# 補全時忽略大小寫
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# 補全選單用方向鍵選擇
zstyle ':completion:*' menu select

# 補全顯示顏色
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# 顯示補全類型說明
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'

# Starship
eval "$(/usr/local/bin/starship init zsh)"
