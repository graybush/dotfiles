# .bashrc

# if not running interactively, don't do anyting 
case $- in
    *i*) ;; # if i in $-, continue
*) return;; # else return
esac

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Set up aliases
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

# vi movement in bash shell
set -o vi
# multiple terminals log to same hist file 
shopt -s histappend
HISTCONTROL=ignoredup
export NMON=lmkn

COLOR="\e[1;32m" # Default to green
PS1="\[${COLOR}\][\u@\h \[\e[00m\]\W\[${COLOR}\]]\$ \[\e[00m\]"
