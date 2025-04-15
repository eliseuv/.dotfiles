{ pkgs, ... }:
{

  home.packages = with pkgs; [
    # Lua version pinned because of neovim
    lua5_1
    # LSP
    lua-language-server
    # Formatter
    stylua
    # Lua Rocks
    lua51Packages.luarocks
  ];

}
