#!/usr/bin/env bash
set -e

for f in $(ls -A dotfiles/); do \
	  bn=$(basename $f)
    target=$HOME/$bn
	  if test -f $target -a '!' -L $target; then
	      echo "error: $target exists; remove it to opt-in to installation, then"
	      echo "  rerun make install-dotfiles"
	  else
	      echo "Installing $target"
	      ln -sf $(pwd)/dotfiles/$bn $target
	  fi;
done
