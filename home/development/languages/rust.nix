{ pkgs, lib, ... }:
let
  # Rustup update script
  rustup-update = pkgs.writeShellScriptBin "rustup-update" ''
    ${pkgs.rustup}/bin/rustup update && ${pkgs.libnotify}/bin/notify-send "Rustup" "Update completed" || ${pkgs.libnotify}/bin/notify-send "Rustup" "Update failed" -u critical
  '';
in
{

  home.packages = with pkgs; [

    rustup

    # Rustup update script
    rustup-update

    # Cargo
    cargo-watch
    cargo-info
    cargo-generate
    cargo-cache
    cargo-binstall
    cargo-update
    cargo-clean-recursive
    cargo-cross
    cargo-fuzz
    cargo-nextest

    # CLI Crate Docs
    rusty-man

    # Compilation cache
    sccache

    # Debugging
    lldb

    # https://nixos.wiki/wiki/Rust#Building_Rust_crates_that_require_external_system_libraries
    openssl.dev
    pkg-config

  ];

  # Cargo will look for OpenSSL with pkg-config
  home.sessionVariables.PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";

  # Environment variables for Rust
  home.sessionVariables = {
    RUSTC_WRAPPER = "sccache";
    RUST_BACKTRACE = 1;
    RUST_LOG = "warn";
  };

  # Background program analyzer
  programs.bacon = {
    enable = true;
    settings = {
      default_job = "clippy-all";
    };
  };

  # rustup update
  systemd.user.services.rustup-update = {
    Unit = {
      Description = "Update rustup toolchains";
      Wants = [
        "network.target"
        "nss-lookup.target"
      ];
      After = [
        "network.target"
        "nss-lookup.target"
      ];
    };
    Service = {
      Type = "oneshot";
      ExecStart = lib.getExe rustup-update;
    };
    Install.WantedBy = [ "default.target" ];
  };

  # rustup update timer
  systemd.user.timers.rustup-update = {
    Unit.Description = "Scheduled rustup update";
    Timer = {
      OnCalendar = "*-*-* 01:00:00 UTC";
      Persistent = true;
      # Run after boot
      OnBootSec = "1m";
      RandomizedDelaySec = "1m";
    };
    Install.WantedBy = [ "timers.target" ];
  };

}
