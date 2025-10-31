{ pkgs, ... }:
{

  programs.vscode = {

    enable = true;
    profiles = {
      default = {
        extensions = with pkgs.vscode-extensions; [
          # Vim emulation
          vscodevim.vim
          # Theme
          catppuccin.catppuccin-vsc
          catppuccin.catppuccin-vsc-icons
          # Copilot
          github.copilot
          github.copilot-chat
        ];
      };
    };

  };

}
