{ pkgs, ... }: {

  home.packages = with pkgs; [
    # Give Clang compiler priority
    (hiPrio clang)
    gcc
  ];

}
