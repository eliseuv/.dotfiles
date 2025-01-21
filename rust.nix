{ config, pkgs, ... }: {

  home.packages = with pkgs; [
    rustup
  ];

  home.sessionVariables = {
    RUST_BACKTRACE = 1;
    RUSTC_WRAPPER = "sccache";
    RUST_LOG = "debug";
  };

  programs.bacon = {
    enable = true;
    settings = {
      default_job = "clippy-all";
    };
  };

}
