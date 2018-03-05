if [ ! -f "$HOME/.zsh/antigen.zsh" ]; then
  echo "Antigen is not installed! Bailing."
  return
fi

source "$HOME/.zsh/antigen.zsh"

antigen use oh-my-zsh

antigen bundle zsh-users/zsh-syntax-highlighting

plugins=(
  debian
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
export PATH="$HOME/bin:$PATH"

export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then
  eval "$(rbenv init -)"
fi

export EDITOR=vim

# Use Virtualenvwrapper if it exists
if [ -f /usr/share/virtualenvwrapper/virtualenvwrapper.sh ]; then
  source /usr/share/virtualenvwrapper/virtualenvwrapper.sh
fi

# Set up custom autocompletions
fpath=(~/.zsh/completions $fpath)
autoload -U compinit && compinit

# aliases
alias fdate='date +%Y-%m-%d_%H-%M-%S'  # useful for dates in filenames
alias cx='chef exec'
alias bx='bundle exec'
alias cxk='chef exec knife'
alias bxk='bundle exec knife'
alias tdbag='knife solo data bag --data-bag-path test/integration/data_bags --secret-file test/integration/encrypted_data_bag_secret'
alias gitflake="git status | grep modified | awk '{print \$2}' | xargs -n1 pep8"

#envfile="$HOME/.gnupg/gpg-agent.env"
#if [[ -e "$envfile" ]] && kill -0 $(grep GPG_AGENT_INFO "$envfile" | cut -d: -f 2) 2>/dev/null; then
#  eval "$(cat "$envfile")"
#else
#  eval "$(gpg-agent --daemon --enable-ssh-support --write-env-file "$envfile")"
#fi
#export GPG_AGENT_INFO  # the env file does not contain the export statement
#export SSH_AUTH_SOCK   # enable gpg-agent for ssh

# Load in a local zshrc if it's available
if [ -f "$HOME/.zshrc.local" ]; then
  source "$HOME/.zshrc.local"
fi
