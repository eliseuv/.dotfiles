{ pkgs, ... }:
{

  imports = [
    ./maintenance.nix
    ./users.nix
    ./development.nix
    ./locale.nix
    ./time.nix
    ./gnupg.nix
  ];

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  programs = {

    git.enable = true;

    vim = {
      enable = true;
      defaultEditor = true;
    };

    firefox.enable = true;

  };

  environment.systemPackages = with pkgs; [ xterm ];

}
