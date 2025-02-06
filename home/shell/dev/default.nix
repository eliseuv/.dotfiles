{ pkgs, ... }: {

  imports = [ ./nix.nix ./julia.nix ./rust.nix ];

  home.packages = with pkgs; [

    # Command runner
    just

    # Benchmarking
    hyperfine

    # NodeJS
    nodejs

    # Development Environments
    devenv

  ];

  # Use direnv
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableZshIntegration = true;
  };
  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "direnv" ];
    };
  };

}
