if [ ! -f "$HOME/.zsh/antigen.zsh" ]; then
  echo "Antigen is not installed! Bailing."
  return
fi

source "$HOME/.zsh/antigen.zsh"

antigen use oh-my-zsh

antigen bundle zsh-users/zsh-syntax-highlighting

plugins=(
  debian
  dotenv
  docker
  git
  pass
  pip
  python
  sudo
)
for plugin in $plugins; do
  antigen bundle $plugin
done

antigen theme gianu

antigen apply

# Important variables
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then
  eval "$(rbenv init -)"
fi

if [ -d "$HOME/.pyenv" ]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"

  eval "$(pyenv init -)"
fi

export EDITOR=vim

# Use Virtualenvwrapper if it exists
if [ -f /usr/share/virtualenvwrapper/virtualenvwrapper.sh ]; then
  source /usr/share/virtualenvwrapper/virtualenvwrapper.sh
fi

# Set up custom autocompletions
fpath=(~/.zsh/completions $fpath)
autoload -U compinit && compinit

# Set up colors for gruvbox
gruvbox_palette="$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"
if [ -f $gruvbox_palette_path ]; then
    source "$gruvbox_palette"
fi

# aliases
alias fdate='date +%Y-%m-%d_%H-%M-%S'  # useful for dates in filenames
alias cx='chef exec'
alias bx='bundle exec'
alias cxk='chef exec knife'
alias bxk='bundle exec knife'
alias tdbag='knife solo data bag --data-bag-path test/integration/data_bags --secret-file test/integration/encrypted_data_bag_secret'
alias gitflake="git status | grep modified | grep '.py' | awk '{print \$2}' | xargs -n1 pep8"
alias fix_completion="rm ~/.zcompdump* ~/.antigen/.zcompdump*"
alias gum="git checkout master && git pull origin master"
alias guum="git checkout master && git pull upstream master"
alias pass-sync="pass git pull && pass git push"

#envfile="$HOME/.gnupg/gpg-agent.env"
#if [[ -e "$envfile" ]] && kill -0 $(grep GPG_AGENT_INFO "$envfile" | cut -d: -f 2) 2>/dev/null; then
#  eval "$(cat "$envfile")"
#else
#  eval "$(gpg-agent --daemon --enable-ssh-support --write-env-file "$envfile")"
#fi
#export GPG_AGENT_INFO  # the env file does not contain the export statement
#export SSH_AUTH_SOCK   # enable gpg-agent for ssh

export SSH_AUTH_SOCK="${XDG_RUNTIME_DIR}/ssh-agent.socket"


# If silversearcher is available, use that for FZF file finding
if which ag > /dev/null; then
  export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
fi

# If auto-updates require a reboot, yell about that when a shell is spawned
if [ -f "/var/run/reboot-required" ]; then
  cat /var/run/reboot-required
fi

if [ -d "/opt/android-sdk/platform-tools" ]; then
  export PATH="$PATH:/opt/android-sdk/platform-tools"
fi

# Load in a local zshrc if it's available
if [ -f "$HOME/.zshrc.local" ]; then
  source "$HOME/.zshrc.local"
fi
