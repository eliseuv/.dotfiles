{ config, pkgs, ... }: {

  home.packages = with pkgs; [ nil nixd nixfmt-classic ];

}
