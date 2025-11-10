{ pkgs-unstable, ... }:
{

  home.packages = with pkgs-unstable; [ gemini-cli ];

}
