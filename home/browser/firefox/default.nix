{ pkgs, ... }:
{

  programs.firefox = {
    enable = true;
    nativeMessagingHosts = [ pkgs.tridactyl-native ];
    profiles = {
      "evf" = {
        userChrome = builtins.readFile ./userChrome.css;
      };
    };
  };

  # Copy tridactyl config
  home.file = {
    ".config/tridactyl/tridactylrc".source = ./tridactylrc;
  };

}
