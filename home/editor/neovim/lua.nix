{ pkgs, ... }:
{

  home.packages = with pkgs; [

    # Neovim requires Lua 5.1
    lua5_1

    # LSP
    lua-language-server

    # Formatter
    stylua

    # Lua Rocks
    lua51Packages.luarocks

  ];

}
