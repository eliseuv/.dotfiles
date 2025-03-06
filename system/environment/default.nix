{ pkgs, ... }: {

  imports =
    [ ./users.nix ./development.nix ./locale.nix ./time.nix ./gnupg.nix ];

  nixpkgs.config.allowUnfree = true;

  programs.nh = {
    enable = true;
    flake = ../..;
    clean = {
      enable = true;
      extraArgs = "--keep 8";
      dates = "daily";
    };
  };

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
