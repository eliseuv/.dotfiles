{ ... }:
{

  imports = [

    # TUI
    ./neovim/default.nix
    ./helix.nix

    # GUI
    ./emacs/default.nix
    ./zed.nix
    ./vscode.nix

  ];

  programs.neovim.defaultEditor = true;

  home.sessionVariables = {
    VISUAL = "emacsclient -c -a emacs";
  };

}
