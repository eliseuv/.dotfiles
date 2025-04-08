{ ... }:
{

  services.home-manager.autoExpire = {
    enable = true;
    frequency = "monthly";
    timestamp = "-30 days";
    store = {
      cleanup = true;
      options = "--delete-older-than 30d";
    };
  };

}
