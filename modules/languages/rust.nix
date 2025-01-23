{ config, pkgs, ... }: {

  home.packages = with pkgs; [
    # Rust installer
    rustup
    # Compilation cache
    sccache
  ];

  home.sessionVariables = {
    RUST_BACKTRACE = 1;
    RUSTC_WRAPPER = "sccache";
    RUST_LOG = "debug";
  };

  programs.bacon = {
    enable = true;
    settings = { default_job = "clippy-all"; };
  };

}
