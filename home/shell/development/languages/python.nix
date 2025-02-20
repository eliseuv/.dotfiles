{ pkgs, ... }: {

  home.packages = with pkgs; [

    python3

    # Package and project manager
    uv

  ];

  programs.ruff = { enable = true; };

}
