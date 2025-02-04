{ pkgs, ... }: {

  imports = [ ./nix.nix ./python.nix ./rust.nix ];

  home.packages = with pkgs; [

    # Standard compilers
    (hiPrio clang)
    gcc

    # Command runner
    gnumake
    just

    # Benchmarking
    hyperfine

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
    extra   
      plugins = [ "direnv" ];
    };
  };

}
