{ pkgs, ... }: {

  imports = [
    # Shell
    ./zsh.nix
    # Prompt
    ./starship.nix
    # Multiplexer
    ./tmux.nix
    ./zellij.nix
    # Tools
    ./zoxide.nix
    ./eza.nix
    ./bat.nix
    ./fd.nix
    ./ripgrep.nix
    ./fzf.nix
    # File manager
    ./broot.nix
    ./yazi.nix
    # Git
    ./git.nix
    ./github.nix
    # System monitor
    ./bottom.nix
    # GnuPG
    ./gpg.nix
    # SSH
    ./ssh.nix
    # Fetch
    ./fastfetch.nix
    # Scripts
    ./scripts.nix
  ];

  home.packages = with pkgs; [

    # LUKS
    cryptsetup

    # Stream editor
    sd

    # Disk usage analyzer
    dua

  ];

  # Aliases
  home.shellAliases = {

    # Clear
    c = "clear";

    # rsync
    rs = "rsync -Pazvhm";
    rsmv = "rsync -Pazvhm --remove-source-files";

  };

}
