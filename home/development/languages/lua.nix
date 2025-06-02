{ pkgs, ... }:
{

  home.packages = with pkgs; [

    lua

    # LSP
    lua-language-server

    # Formatter
    stylua

    # Lua Rocks
    luarocks
  ];

}
