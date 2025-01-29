{ pkgs, ... }: {

  home.packages = [
    # Test script
    (import ./my-awesome-script.nix { inherit pkgs; })
  ];

}
