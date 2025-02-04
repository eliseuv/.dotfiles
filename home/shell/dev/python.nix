{ pkgs, ... }: {

  home.packages = with pkgs; [
    # Package and project manager
    uv
    # Linter
    ruff
  ];

}
