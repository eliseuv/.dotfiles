{ config, pkgs, ... }: {

  programs.firefox = {
    enable = true;
    nativeMessagingHosts = [ pkgs.tridactyl-native ];
  };

  home.file = { ".config/tridactyl/tridactylrc".source = ../tridactylrc; };

}
