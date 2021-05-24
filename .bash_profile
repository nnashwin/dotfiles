source ~/.bashrc

export GOPATH="$HOME/go/"
export PATH="$HOME/go/bin:$PATH"
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv) eval export HOMEBREW_PREFIX="/home/linuxbrew/.linuxbrew"; export HOMEBREW_CELLAR="/home/linuxbrew/.linuxbrew/Cellar"; export HOMEBREW_REPOSITORY="/home/linuxbrew/.linuxbrew/Homebrew"; export PATH="/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin${PATH+:$PATH}"; export MANPATH="/home/linuxbrew/.linuxbrew/share/man${MANPATH+:$MANPATH}:"; export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:${INFOPATH:-}";
source "$HOME/.cargo/env"
