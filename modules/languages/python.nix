{ pkgs, ... }: {

  home.packages = with pkgs; [
    python3
    # Linter
    ruff
    # Package and project manager
    uv
  ];

}
