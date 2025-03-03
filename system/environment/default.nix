{ pkgs, ... }: {

  imports = [
    ./user.nix
    ./zsh.nix
    ./development.nix
    ./locale.nix
    ./time.nix
    ./gnupg.nix
  ];

  environment.systemPackages = with pkgs; [ vim ];

  programs.firefox.enable = true;

}
