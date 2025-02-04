{ pkgs, ... }: {

  imports = [ ./nix.nix ./python.nix ./rust.nix ];

  home.packages = with pkgs; [

    # C compilers
    (hiPrio clang)
    gcc

    # Command runner
    just

    # Benchmarking
    hyperfine

  ];

}
