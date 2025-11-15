{
  pkgs-unstable,
  lib,
  ...
}:
let
  gemini-cli-override = pkgs-unstable.gemini-cli.overrideAttrs (old: rec {
    version = "0.15.4";
    src = pkgs-unstable.fetchFromGitHub {
      owner = "google-gemini";
      repo = "gemini-cli";
      tag = "v${version}";
      hash = "sha256-muj8KcF7HKcgkDkjGZhCLzwv5F2gxsO+CvEp3OqhNck=";
    };
    npmDepsHash = "sha256-6pq0H8fqS6aZNsvKmn28Gn+4PQkVpWz70nS4HKWi5PA=";
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
