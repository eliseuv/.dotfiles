{ config, pkgs, ... }: {
  imports = [
    ./tools/flake.nix
    ./tmux/flake.nix
    ./zellij/flake.nix
    ./fastfetch/flake.nix
  ];

  # ZSH
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableVteIntegration = true;
    autosuggestion = {
      enable = true;
      strategy = [ "history" "completion" ];
    };
    syntaxHighlighting.enable = true;
    defaultKeymap = "emacs";
    history = {
      append = true;
      expireDuplicatesFirst = true;
      ignoreAllDups = true;
      ignoreSpace = true;
      save = 1000000;
      size = 1000000;
    };
    initExtra = ''
      bindkey '^ ' autosuggest-accept
      bindkey  "^[[H"   beginning-of-line
      bindkey  "^[[F"   end-of-line
      bindkey  "^[[3~"  delete-char

      fastfetch
    '';

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
    };
  };

  # Prompt
  programs.starship = {
    enable = true;
    settings = {
      add_newline = true;
      character.success_symbol = "[λ](bold green)";
      directory = {
        truncation_length = 5;
        truncation_symbol = ".../";
        read_only = " 󰌾";
        substitutions = {
          "Documents" = "󰈙 ";
          "Projects" = "</>";
          "Downloads" = " ";
          "Music" = " ";
          "Pictures" = " ";
        };
      };
    };
  };

  # Aliases
  home.shellAliases = {
    c = "clear";
    rs = "rsync -Pazvhm";
    rsmv = "rsync -Pazvhm --remove-source-files";
    stow = "stow --no-folding";
  };

  # # Shell scripts
  # home.sessionPath = [ "$HOME/.local/bin" ];
  # home.file = {
  #   ".local/bin" = {
  #     source = ./scripts;
  #     recursive = true;
  #   };
  # };

}
