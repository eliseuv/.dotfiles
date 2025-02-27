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
    ./documents/default.nix
    # Scripts
    ./scripts.nix
    # Extras
    ./extra/fastfetch.nix
    ./extra/nix-index-database.nix
    ./extra/tldr.nix
    ./extra/youtube.nix
  ];

  home.packages = with pkgs; [

    # LUKS
    cryptsetup

    # Utilities
    unzip
    wget

  ];

  home.sessionVariables = {
    # Config files path
    DOTFILES = "$HOME/.dotfiles";
  };

  # Aliases
  home.shellAliases = {

    # Clear
    c = "clear";

    # Create parent directories as needed
    mkdir = "mkdir -p";

    # Confirm before overwriting or deleting
    cp = "cp -i";
    mv = "mv -i";
    rm = "rm -i";

    # rsync
    rs = "rsync -Pazvhm";
    rsmv = "rsync -Pazvhm --remove-source-files";

    # Update flake
    up = "pushd $DOTFILES && just update && popd";

  };

}
