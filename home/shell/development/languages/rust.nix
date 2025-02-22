{ pkgs, ... }: {

  home.packages = with pkgs; [

    (rust-bin.selectLatestNightlyWith (toolchain:
      toolchain.default.override {
        extensions = [ "rust-analyzer" "rust-src" ];
      }))

    # Cargo
    cargo-watch
    cargo-info
    cargo-generate
    cargo-cache
    cargo-binstall
    cargo-update
    cargo-cross

    # Compilation cache
    sccache

    # https://nixos.wiki/wiki/Rust#Building_Rust_crates_that_require_external_system_libraries
    openssl.dev
    pkg-config

  ];

  # Cargo will look for OpenSSL with pkg-config
  home.sessionVariables.PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";

  home.sessionVariables = {
    RUSTC_WRAPPER = "sccache";
    RUST_BACKTRACE = 1;
    RUST_LOG = "debug";
  };

  programs.bacon = {
    enable = true;
    settings = { default_job = "clippy-all"; };
  };

}
