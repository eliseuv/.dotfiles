{ pkgs, ... }: {

    imports = [ ./user.nix ./zsh.nix ./locale.nix ./time.nix ./gpg.nix];

  environment.systemPackages = with pkgs; [ vim ];

  programs.firefox.enable = true;

}
