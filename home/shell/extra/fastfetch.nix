{ ... }: {

  programs.fastfetch = { enable = true; };

  home.file = {
    ".config/fastfetch/config.jsonc".source = ./fastfetch/config.jsonc;
    ".config/fastfetch/nixos.png".source = ../../../resources/logos/nixos.png;
  };

}
