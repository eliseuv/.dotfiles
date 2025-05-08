{ pkgs, ... }:
{

  home.packages = with pkgs; [

    # Node
    nodejs

    # Typescript
    typescript

    # Sass
    sass

  ];

  # Bun JS runtime
  programs.bun = {
    enable = true;
  };

}
