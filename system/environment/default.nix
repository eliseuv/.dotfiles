{ pkgs, ... }: {

  imports = [ ./user.nix ./zsh.nix ./locale.nix ./time.nix ./gpg.nix ];

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [ vim ];

  programs.firefox.enable = true;

}
