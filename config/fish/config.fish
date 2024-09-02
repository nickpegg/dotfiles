fish_add_path ~/.dotfiles/bin
fish_add_path ~/bin
fish_add_path ~/.local/bin
fish_add_path /var/lib/flatpak/exports/bin

# Ruby stuff
fish_add_path ~/.rbenv/bin
if which rbenv > /dev/null
    eval "$(rbenv init -)"
end

# Python stuff
if test -d ~/.pyenv
    set PYENV_ROOT ~/.pyenv
    fish_add_path "$PYENV_ROOT/bin"
    eval "$(pyenv init -)"
end
fish_add_path ~/.poetry/bin

# Go stuff
set -g GOPATH ~/code/go

# aliases
abbr -a cx chef exec
abbr -a cx bundle exec
abbr -a wifi nmcli device wifi
abbr -a gum "git switch main && git pull origin main"
abbr -a guum "git switch main && git pull upstream main"

if status is-interactive
    # Commands to run in interactive sessions can go here

    function fish_greeting
    end

    # fish_config theme choose 'ayu Dark'
    theme_gruvbox dark

    # function fish_right_prompt
    #     date '+%Y-%m-%d %H:%M:%S'
    # end

    set -g EDITOR vim

    # Start a ssh-agent if SSH_AUTH_SOCK isn't already set
    if test -z $SSH_AUTH_SOCK
        set -g SSH_AUTH_SOCK $XDG_RUNTIME_DIR/ssh-agent.socket

        # A systemd service for ssh-agent should have created the socket. Start up an
        # agent if that's not the case.
        if not test -e $SSH_AUTH_SOCK
            eval $(ssh-agent -a $SSH_AUTH_SOCK)
        end
    end
end
