# aliases

# Turn on colors if they are available
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
#else
#    alias ls='ls -F'
fi

alias ll='ls -lh'
alias la='ls -Ah'
alias dirs='dirs -v'
alias j2='sudo -i -u j2eeadmin'
alias cdlog='cd ~/esshome/swafsdata/global/local/log'

# Deep file explorer
alias dirTree="find . -maxdepth 4 -name '\.[^.]*' -prune -o -print | sed -e 's/\.\///' -e 's/[^/^|]*\// --- /g' -e 's/---  / |  /g '"

# User specific aliases and functions

# Opens SSH on a new screen window with the appropriate name.
screen_ssh() {
    args=$#
    screen -t ${!args} ssh -X -C $@
}
screen_vim() {
    args=$#
    screen -t ${!args} vim $@
}
screen_cd()
{
    cd "$*"
    screen -X chdir "$PWD" 
}

# if [ $TERM == "screen" -o $TERM == "screen.linux" ]; then
if [ "$TERM" == "screen" ]; then
    alias ssh=screen_ssh
    # alias vim=screen_vim
    alias cd=screen_cd
fi

