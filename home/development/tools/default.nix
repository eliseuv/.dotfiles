{ pkgs, ... }:
{

  imports = [ ./pueue.nix ];

  home.packages = with pkgs; [

    # Command runner
    gnumake
    cmake
    just

    # Run command on change
    watchexec

    # Benchmarking
    hyperfine

    # Profiler
    cargo-flamegraph

    # Formatter
    prettierd

  ];

}
