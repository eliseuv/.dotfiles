{ pkgs, ... }:
{

  imports = [

    # Minecraft
    ./minecraft.nix

    # Retroarch
    ./retroarch.nix

  ];

  home.packages = with pkgs; [

  ];

}
