{ pkgs, ... }: {

  imports = [
    # Shell
    ./shell/zsh.nix
    # Prompt
    ./prompt/starship.nix
    # Multiplexer
    ./multiplexer/tmux.nix
    # Tools
    ./tools/default.nix
    # Development
    ./development/default.nix
    # Git
    ./git/default.nix
    # GnuPG
    ./gpg.nix
    # SSH
    ./ssh.nix
    # Documents
    ./documents/typst.nix
    # Scripts
    ./scripts.nix
    # Fetch
    ./extra/fastfetch.nix
    # Nix Index Database
    ./extra/nix-index-database.nix
  ];

  home.packages = with pkgs;
    [

      # LUKS
      cryptsetup

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
