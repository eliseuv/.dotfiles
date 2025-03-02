{ pkgs, ... }: {

  imports =
    [ ./users.nix ./development.nix ./locale.nix ./time.nix ./gnupg.nix ];

  nixpkgs.config.allowUnfree = true;

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
