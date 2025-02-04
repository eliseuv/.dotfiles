update:
    nix flake update

home-switch:
    home-manager switch --flake .

system-test:
    nixos-rebuild test --flake . --use-remote-sudo --show-trace --verbose

system-switch:
    git diff -U0 '*.nix'
    nixos-rebuild switch --flake . --use-remote-sudo
    git commit --allow-empty -am "$(hostname) @ $(nixos-rebuild list-generations | grep current)"
    git push

gc:
    sudo nix-collect-garbage
