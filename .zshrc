if [[ $ZSH_ENABLE_PROFILING == 1 ]]; then
  zmodload zsh/zprof
fi

# download & enable shell completions
load_shell_completions() {
  if [[ ! -r ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autocomplete ]]; then
    git clone https://github.com/marlonrichert/zsh-autocomplete.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autocomplete
  fi
}

# download & enable zsh-autosuggestions
load_shell_suggestions() {
  if [[ ! -r ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions ]]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  fi
}

# Oh My ZSH
load_oh_my_zsh() {
  export ZSH="$HOME/.oh-my-zsh"
  ZSH_THEME="robbyrussell"
  plugins=(
    # completion
    zsh-autocomplete
    zsh-autosuggestions
    aliases
    common-aliases
    alias-finder

    # programs
    git
    git-auto-fetch
    gitignore
    gh
    vscode
    brew
    catimg

    # languages
    rust
    python
    pip
    autopep8
    mongocli
    golang
    charm

    # system
    gpg-agent
    safe-paste
    battery
    emoji
    firewalld
    macos

    # misc
    history
  )

  source $ZSH/oh-my-zsh.sh
}

# bun
load_bun() {
  export BUN_INSTALL="$HOME/.bun"
  export PATH="$BUN_INSTALL/bin:$PATH"
  [ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
}

# node
load_node() {
  export PATH="/opt/homebrew/opt/node@22/bin:$PATH"
  export LDFLAGS="-L/opt/homebrew/opt/node@22/lib"
  export CPPFLAGS="-I/opt/homebrew/opt/node@22/include"
}

# misc env
load_env() {
  . "$HOME/.local/bin/env"
}

# start
load_shell_completions
load_shell_suggestions
load_oh_my_zsh
load_bun
load_node
load_env

if [[ $ZSH_ENABLE_PROFILING == 1 ]]; then
  zprof
fi