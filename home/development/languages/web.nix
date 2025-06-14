{ pkgs, ... }:
{

  home.packages = with pkgs; [

    # Node
    nodejs

    # Typescript
    typescript
    typescript-language-server

    # html/css/json/eslint language servers
    vscode-langservers-extracted

    # Sass
    sass

  ];

  # Bun JS runtime
  programs.bun = {
    enable = true;
  };

}
