#!/usr/bin/env bash

set -e

pushd ~/.dotfiles

git diff -U0 '*.nix'

sudo nixos-rebuild switch --flake .

git commit --allow-empty -am "$(hostname) @ $(nixos-rebuild list-generations | grep current)"

git push

popd
