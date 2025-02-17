{ ... }: {

  imports = [

    # TUI
    ./neovim.nix
    ./helix.nix

    # GUI
    ./emacs.nix
    ./zed.nix

  ];

  programs.neovim.defaultEditor = true;

  home.sessionVariables = { VISUAL = "emacsclient -c -a emacs"; };

}
