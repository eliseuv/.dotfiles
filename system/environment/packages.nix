{ pkgs, ... }: {

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [ vim ];

  programs.firefox.enable = true;

}
