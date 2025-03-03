{ pkgs, ... }: {

  imports = [
    ./users.nix
    ./zsh.nix
    ./development.nix
    ./locale.nix
    ./time.nix
    ./gnupg.nix
  ];


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
