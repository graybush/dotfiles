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

# added by Anaconda3 4.1.1 installer
# export PATH="/media/anaconda3/bin:/usr/local/cuda-8.0/bin:$PATH"

# added by Anaconda2 4.0.0 installer
export PATH="$HOME/.local/bin:/usr/local/bin/anaconda2/bin:/usr/local/cuda-8.0/bin:/usr/local/apache-maven-3.5.2/bin:/home/centos/workspace/mercurial-2.3.2:$PATH"
export HISTCONTROL=ignoredup
# export HISTCONTROL=ignoreboth
umask 007

# Get the appropriate prompt color
HOSTNAME=$(hostname)
HCOLOR='\e[1;32m' # Default to green
if [ "${HOSTNAME: -1}" == 't' ]; then # if a test box
    HCOLOR='\e[1;33m' # Use yellow
elif [ "${HOSTNAME: -1}" == 'p' ]; then # if a prod box
    HCOLOR='\e[1;31m' # Use red
fi

# PS1="\[$HCOLOR\][\! \u@\h \[\e[00m\]\W\[$HCOLOR\]]\$ \[\e[00m\]"
# PS1="\[$HCOLOR\][\! \u@\h \[\e[00m\]\W\[$HCOLOR\]]\$ \[\e[00m\]"
PS1="\[$HCOLOR\][\u@\h \[\e[00m\]\W\[$HCOLOR\]]\$ \[\e[00m\]"

# multiple terminals log to same hist file 
shopt -s histappend

#allow <C-S> to be used in vim
stty -ixon

# Add the local environment to PATH
# export PATH=$PATH:$HOME/.local/bin
# export MAVEN_OPTS="-Xmx512m -XX:MaxPermSize=512m"
