{ pkgs, ... }: {

  imports = [

    # Shell
    ./shell/zsh.nix

    # Prompt
    ./prompt/starship.nix

    # Tools
    ./tools/default.nix

    # Multiplexer
    ./multiplexer/tmux.nix

    # Scripts
    ./scripts/default.nix

    # Extra
    ./extra/fastfetch/default.nix
    ./extra/tldr.nix

  ];

  home.packages = with pkgs;
    [

      unzip

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
    mkdir = "mkdir -pv";

    # Confirm before overwriting or deleting
    cp = "cp -iv";
    mv = "mv -iv";
    rm = "rm -iv";

    # rsync
    rs = "rsync -Pazvhm";
    rsmv = "rsync -Pazvhm --remove-source-files";

    # Edit configs
    dots = ''cd $DOTFILES && nvim "+lua Snacks.picker.files()"'';

    # Update flake
    up = "pushd $DOTFILES && just update && popd";

  };

}
