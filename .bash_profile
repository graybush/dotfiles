# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

umask 0007
#allow <C-S> to be used in vim
stty -ixon

PATH=${HOME}/.local/bin:/opt/adb-fastboot/platform-tools:/opt/maven/bin:/opt/mercurial:${PATH}
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
