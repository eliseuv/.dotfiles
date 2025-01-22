{ config, pkgs, ... }: {

  programs.ssh = {
    enable = true;
    compression = true;
    addKeysToAgent = "yes";
    forwardAgent = true;
    serverAliveInterval = 240;
    matchBlocks = {
      # Alpine Linux VM
      "alpine-vm" = {
        hostname = "alpine-vm.local";
        user = "evf";
      };
      # Personal computer at IF-UFRGS
      "if-ufrgs" = {
        hostname = "143.54.45.50";
        user = "evf";
        proxyJump = "alpine-vm";
      };
      # LIEF
      "lief" = {
        hostname = "lief.if.ufrgs.br";
        user = "eliseuvf";
        proxyJump = "alpine-vm";
      };
      # Ada Lovelace cluster
      "lovelace" = {
        hostname = "lovelace.if.ufrgs.br";
        user = "eliseuvf";
        proxyJump = "alpine-vm";
      };
      # Ada Lovelace cluster
      "ada" = {
        hostname = "lovelace.if.ufrgs.br";
        user = "eliseuvf";
        proxyJump = "alpine-vm";
      };
    };
  };

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
    pinentryPackage = pkgs.pinentry-gtk2;
  };

}
