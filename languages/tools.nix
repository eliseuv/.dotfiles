{ config, pkgs, ... }: {

  home.packages = with pkgs; [
    # Build tool
    just
    # Benchmarking
    hyperfine
  ];

}
