# aliases

# Turn on colors if they are available
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls -N --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto --exclude-dir={.hg,target}'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
#else
#    alias ls='ls -F'
fi

alias ll='ls -lhN'
alias la='ls -AhN'
alias dirs='dirs -v'
alias ssh='ssh -XC'
alias me='ps -fu $(whoami)'
alias fixterm='stty sane; stty erase ^h'

# Deep file explorer
alias dirtree="find . -maxdepth 4 -name '\.[^.]*' -prune -o -print | sed -e 's/\.\///' -e 's/[^/^|]*\// --- /g' -e 's/---  / |  /g '"

screen_ssh() {
    args=$#
    screen -t ${!args} ssh -X -C $@
}
screen_vim() {
    args=$#
    screen -t ${!args} vim $@
}
screen_cd() {
    cd "$*"
    screen -X chdir "$PWD"
}

if [[ -n $(ps -fu $(whoami) | awk '{print $8}' | grep 'screen') ]]; then
  alias cd=screen_cd
  alias ssh=screen_ssh
  # alias vim=screen_vim
fi

