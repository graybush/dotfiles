#!/usr/bin/env bash
set -e

mkdir -p $HOME/.local/bin
for f in bin/*; do
    if ! test -x ${f}; then continue; fi
    ln -sfr ${f} ~/.local/bin
done
