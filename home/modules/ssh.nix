{ ... }: {

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

}
