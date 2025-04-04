{ pkgs, ... }: {

  home.packages = with pkgs; [

    python3

    # Package and project manager
    uv

    basedpyright

  ];

  programs.ruff = {
    enable = true;
    settings = { };
  };

}
