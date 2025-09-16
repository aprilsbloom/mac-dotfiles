# download & start znap (ZSH plugin manager)
if [[ ! -r ~/.config/zsh/znap/znap.zsh ]]; then
  git clone --depth 1 -- https://github.com/marlonrichert/zsh-snap.git $HOME/.config/zsh/znap
fi

source $HOME/.config/zsh/znap/znap.zsh

# download & enable shell completions
if [[ ! -r ~/.config/zsh/marlonrichert/zsh-autocomplete/zsh-autocomplete.plugin.zsh ]]; then
  git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git $HOME/.config/zsh/marlonrichert/zsh-autocomplete
fi
source $HOME/.config/zsh/marlonrichert/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# download & enable zsh-autosuggestions
brewprefix=$(/opt/homebrew/bin/brew --prefix)
if [[ ! -r $brewprefix/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]] &&
   [[ ! -r ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
  git clone --depth 1 -- https://github.com/zsh-users/zsh-autosuggestions.git $HOME/.config/zsh/zsh-autosuggestions
fi

if [[ -r $brewprefix/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
  source $brewprefix/share/zsh-autosuggestions/zsh-autosuggestions.zsh
else
  source $HOME/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# node
export PATH="/opt/homebrew/opt/node@22/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/node@22/lib"
export CPPFLAGS="-I/opt/homebrew/opt/node@22/include"

# misc env
. "$HOME/.local/bin/env"
