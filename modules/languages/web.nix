{ config, pkgs, ... }: {

  home.packages = with pkgs; [
    # Typescript
    typescript
    # Node
    nodejs
    # Sass
    sass
    # bun
    bun
  ];

}
