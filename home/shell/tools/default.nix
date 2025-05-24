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

    # Dependency cleaner
    kondo

    # TUI process runner
    mprocs

  ];

}
