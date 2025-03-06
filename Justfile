home-switch:
    nh home switch .

system-test:
    nh os test .

system-switch:
    #!/usr/bin/env bash
    set -euxo pipefail
    git diff -U0 '*.nix'
    nh os switch . | tee /tmp/nh-os-switch.log
    message="$(hostname) @ $(nixos-rebuild list-generations | rg current | sd '^(\d+) current\W+\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}\W+([\w\.]+)\W+([\w\.]+)\W+\*$' '$1 NixOS $2 Linux $3')"
    description="$(< /tmp/nh-os-switch.log)"
    git commit --all --allow-empty --message "$message" --message "$description"
    git push

update *inputs:
    nix flake update {{inputs}} --verbose
    git restore --staged .
    git add flake.lock
    git commit --message "Flake update"

gc:
    nh clean all
