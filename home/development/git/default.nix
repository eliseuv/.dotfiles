{ ... }:
{

  imports = [

    # Git
    ./git.nix

    # GitHub
    ./github.nix

    # TUI
    ./gitui.nix
    ./lazygit.nix

  ];

  # TUI git tool
  home.shellAliases.gg = "lazygit";

}
