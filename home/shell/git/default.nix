{ ... }: {

  imports = [

    ./git.nix

    # CLI
    ./github.nix

    # TUI
    ./gitui.nix
    ./lazygit.nix

  ];

  # TUI git tool
  home.shellAliases.gg = "lazygit";

}
