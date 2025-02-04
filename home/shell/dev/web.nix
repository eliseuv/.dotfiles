{ config, pkgs, ... }: {

  home.packages = with pkgs; [

    # Node
    nodejs

    # bun
    bun

    # Typescript
    typescript

    # Sass
    sass

  ];

}
