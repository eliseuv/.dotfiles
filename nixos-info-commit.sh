#!/usr/bin/env bash

set -e

pushd ~/.dotfiles

git diff -U0 '*.nix'

git commit -am "$(hostname) @ $(nixos-rebuild list-generations | grep current)"

git push

popd
