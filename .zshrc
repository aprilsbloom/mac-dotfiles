# Download & start Znap (ZSH plugin manager)
[[ -r ~/.config/zsh/znap/znap.zsh ]] ||
  git clone --depth 1 -- https://github.com/marlonrichert/zsh-snap.git ~/.config/zsh/znap

source ~/.config/zsh/znap/znap.zsh

# Enable shell completions & auto suggestions
source ~/.config/zsh/marlonrichert/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "/Users/e/.bun/_bun" ] && source "/Users/e/.bun/_bun"

# Node
export PATH="/opt/homebrew/opt/node@22/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/node@22/lib"
export CPPFLAGS="-I/opt/homebrew/opt/node@22/include"

. "$HOME/.local/bin/env"
