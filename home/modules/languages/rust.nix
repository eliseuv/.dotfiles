{ config, pkgs, ... }: {

  home.packages = with pkgs; [
    # Rust installer
    rustup
    # Compilation cache
    sccache
    # https://nixos.wiki/wiki/Rust#Building_Rust_crates_that_require_external_system_libraries
    openssl.dev
    pkg-config
  ];

  # Cargo will look for OpenSSL with pkg-config
  home.sessionVariables.PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";

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
