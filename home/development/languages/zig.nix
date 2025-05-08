{ pkgs, ... }:
{

  home.packages = with pkgs; [
    zig
    zig-shell-completions
  ];

}
