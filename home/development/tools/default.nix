{ pkgs, ... }:
{

  home.packages = with pkgs; [

    # Command runner
    gnumake
    cmake
    just

    # Run command on change
    watchexec

    # Linter
    ast-grep

    # Benchmarking
    hyperfine

    # Profiler
    cargo-flamegraph

    # Formatter
    prettierd

    # Reverse engineering
    ghidra

  ];

}
