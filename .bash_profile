# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

umask 0007
#allow <C-S> to be used in vim
stty -ixon

PATH=${HOME}/.local/bin:${HOME}/workspace/adb-fastboot/platform-tools:${HOME}/workspace/mercurial-2.3.2:/usr/local/apache-maven-3.5.2/bin:${PATH}
export PATH

case $TERM in
  screen.xterm-256color)
    export TERM=xterm-256color
    ;;
esac

case $(hostname) in
  freenas.local)
    export CLICOLOR="YES"
    export LSCOLORS="ExGxFxdxCxDxDxhbadExEx"
    ;;
esac
