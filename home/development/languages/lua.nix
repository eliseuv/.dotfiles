{ pkgs, ... }: {

  home.packages = with pkgs; [
    lua5_1
    # LSP
    lua-language-server
    # Lua Rocks
    lua51Packages.luarocks
  ];
}
