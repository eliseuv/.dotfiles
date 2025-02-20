{ ... }: {

  imports = [

    ./git.nix

    # CLI
    ./github.nix

    # TUI
    ./gitui.nix
    ./lazygit.nix

  ];

}
