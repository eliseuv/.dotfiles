update:
    nix flake update
    git restore --staged .
    git add flake.lock
    git commit --message "Flake update"

home-switch:
    home-manager switch --flake . --show-trace

system-test:
    nixos-rebuild test --flake . --use-remote-sudo --show-trace --verbose

system-switch:
    git diff -U0 '*.nix'
    nixos-rebuild switch --flake . --use-remote-sudo
    git commit --all --allow-empty --message "$(hostname) @ $(nixos-rebuild list-generations | rg current | sd '^(\d+) current\W+\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}\W+([\w\.]+)\W+([\w\.]+)\W+\*$' '$1 NixOS $2 Linux $3')"
    git push

gc:
    sudo nix-collect-garbage
