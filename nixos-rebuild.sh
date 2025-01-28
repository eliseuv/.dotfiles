#!/usr/bin/env bash

set -e

pushd ~/.dotfiles

if git diff --quiet '*.nix'; then
    echo "No changes detected, exiting."
    popd
    exit 0
fi

git diff -U0 '*.nix'

sudo nixos-rebuild switch --flake ~/.dotfiles --show-trace &>nixos-switch.log || (cat nixos-switch.log | grep --color error && exit 1)

current=$(nixos-rebuild list-generations | grep current)
git commit -am "$current"

popd
