{ pkgs, ... }:
{

  home.packages = with pkgs; [

    python3

    basedpyright

  ];

  programs.uv = {
    enable = true;
    settings = { };
  };

  programs.ruff = {
    enable = true;
    settings = { };
  };

  # uv installed tools path
  home.sessionPath = [ "$HOME/.local/bin" ];

}
