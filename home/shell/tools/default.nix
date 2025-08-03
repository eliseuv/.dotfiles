{ pkgs, ... }:
{

  imports = [
    # cd
    ./zoxide.nix
    # ls
    ./eza.nix
    # cat
    ./bat.nix
    # find
    ./fd.nix
    # grep
    ./ripgrep.nix
    # Fuzzy finder
    ./television.nix
    ./fzf.nix
    # File manager
    ./broot.nix
    ./yazi.nix
    # System monitor
    ./bottom.nix
    # Systemctl TUI
    ./systemctl-tui.nix
  ];

  home.packages = with pkgs; [

    # Stream editor
    sd

    # Disk usage analyzer
    dua

    # TUI process runner
    mprocs

  ];

}
