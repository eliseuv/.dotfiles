{ pkgs, ... }: {

  home.packages = [ pkgs.gcr ];

  programs.gpg = {
    enable = true;
    settings = { };
  };

  services.gpg-agent = {
    enable = true;
    enableZshIntegration = true;
    enableSshSupport = true;
    defaultCacheTtl = 3600;
    maxCacheTtl = 3600;
    defaultCacheTtlSsh = 3600;
    maxCacheTtlSsh = 3600;
    pinentryPackage = pkgs.pinentry-gnome3;
  };

}
