home-switch:
    nh home switch

system-test:
    nh os test

system-switch:
    git diff -U0 '*.nix'
    nh os switch
    git commit --all --allow-empty --message "$(hostname) @ $(nixos-rebuild list-generations | rg current | sd '^(\d+) current\W+\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}\W+([\w\.]+)\W+([\w\.]+)\W+\*$' '$1 NixOS $2 Linux $3')" 
    git push

update *inputs:
    nix flake update {{inputs}} --verbose
    git restore --staged .
    git add flake.lock
    git commit --message "Flake update"

gc keep='8':
    nh clean all --keep {{keep}}
