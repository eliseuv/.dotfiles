{
  pkgs-unstable,
  lib,
  ...
}:
let
  gemini-cli-override = pkgs-unstable.gemini-cli.overrideAttrs (old: rec {
    version = "0.16.0";
    src = pkgs-unstable.fetchFromGitHub {
      owner = "google-gemini";
      repo = "gemini-cli";
      tag = "v${version}";
      hash = "sha256-EOiG7Ov+tY6UPci4A67kKcCItkTrrENOm1mSaWxKE94=";
    };
    npmDepsHash = "sha256-JvzrbyiJHbKNRHoGll7eSH4dD6Hj5qnrh4F/upHPntI=";
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
