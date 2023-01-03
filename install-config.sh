#!/usr/bin/env bash
set -e

mkdir -p ~/.config
cp -a --reflink=auto dot-config/* ~/.config/
