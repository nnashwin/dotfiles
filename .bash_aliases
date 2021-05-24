# VIM
alias v="nvim"

# personal-tools
alias tmo="taskmao"
alias tmol="taskmao list"
alias tmoap="taskmao -p"
alias tmoe="taskmao end"
alias tmoi="taskmao info"

# bash
alias bref=". ~/.zshrc"
alias pud="pushd"
alias pd="popd"

# cargo
alias cb="cargo build"
alias cin="cargo init"
alias ci="cargo install"
alias cn="cargo new"
alias cp="cargo publish"
alias cr="cargo run"
alias crr="cargo run --release"
alias ct="cargo test"

# docker
alias db="docker build"
alias dbt="docker build -t"
alias dcb="docker-compose build"
alias dcd="docker-compose down"
alias dcu="docker-compose up"
alias de="docker exec"
alias dk="docker kill"
alias di="docker images"
alias dl="docker logs"
alias dps="docker ps"
alias dr="docker run"
alias drm="docker rm"
alias drmi="docker rmi"
# remove all container images on the local computer
function drmia () {
    ALIASES=$(docker images -q)
    if [ -z $ALIASES ]; then 
        echo "There are no images to be removed ¯\_(ツ)_/¯."
    else
        docker rmi $ALIASES
    fi
}
alias dsta="docker start"
alias dsto="docker stop"
alias dv="docker volume"
function dvrma() {
    IMAGES=$(docker volume ls -q --filter dangling=true)
    docker volume rm $IMAGES
}

# git
alias ga="git add"
alias gae="git add ."
alias gb="git branch"
alias gcl="git clone"
alias gcmsg="git commit -m"
alias gco="git checkout"
alias gd="git diff"
alias gp="git push"
alias gpu="git pull"
alias gpuom="git pull origin master"
alias grh="git reset HEAD"
alias gra="git remote add"
alias grao="git remote add origin"
alias grs="git remote show"
alias grso="git remote show origin"
alias gres="git restore"
alias gst="git status"
alias gt="git tag"
alias gtl="git tag -l"

# go
alias gob="go build"
alias gobgc="go build -gcflags \"-m -m\""
alias gog="go get"
alias gor="go run"
alias got="go test"
alias gota="go test all"

# make
alias m="make"
alias mi="make install"
alias mt="make test"

# npm / node
alias npb="npm run build"
alias npbw="npm run build:watch"
alias npr="npm run"
alias nps="npm start"
alias npt="npm test"

# python
alias deac="deactivate"
alias py3="python3"
alias py="python3"
alias pip="pip3"

# sqlite3
alias sqll3="sqlite3"



# tmux
alias tm="tmux"
alias tma="tmux attach-session"
alias tmks="tmux kill-session"
alias tmkst="tmux kill-session -t"
alias tmls="tmux ls"

# ubuntu specific
alias sagu="sudo apt-get update"
alias sagi="sudo apt-get install"
alias sagyi="sudo apt-get install -y"

# wsl specific
alias openc="explorer.exe ."

# yarn
alias y="yarn"
alias ya="yarn add"
alias yadd="yarn add --dev"
alias yb="yarn build"
alias yd="yarn dev"
alias yi="yarn install"
alias yr="yarn run"
alias yrm="yarn remove"
alias ys="yarn start"
alias yt="yarn test"
