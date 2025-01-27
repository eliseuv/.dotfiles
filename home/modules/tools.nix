{ pkgs, ... }: {

  home.packages = with pkgs; [
    # Unzip
    unzip
    # Build tool
    just
    # Benchmarking
    hyperfine
  ];

}
