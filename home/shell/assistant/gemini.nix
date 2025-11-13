{
  pkgs-unstable,
  lib,
  ...
}:
let
  gemini-cli-override = pkgs-unstable.gemini-cli.overrideAttrs (old: rec {
    version = "0.15.0";
    src = pkgs-unstable.fetchFromGitHub {
      owner = "google-gemini";
      repo = "gemini-cli";
      tag = "v${version}";
      hash = "sha256-m9NF7O0tmxPOtcoYIb6L658dn3OKpT/RYulZiY64Fms=";
    };
    npmDepsHash = "sha256-CyvtMAIWycM0m86GYs6BeQ3EueCk+IluL99/5UaEVr8=";
    npmDeps = pkgs-unstable.fetchNpmDeps {
      inherit src;
      name = "${old.pname}-${version}-npm-deps";
      hash = npmDepsHash;
    };
  });
in
{
  home.packages = [

    # Custom version of Gemini CLI
    gemini-cli-override

  ];
}
