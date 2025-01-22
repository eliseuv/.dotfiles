{ config, pkgs, ... }: {

  programs.helix = {
    enable = true;
    settings = {
      theme = "tokyonight";
      editor = {
        mouse = false;
        line-number = "relative";
        idle-timeout = 100;
        completion-timeout = 100;
        completion-replace = true;
        true-color = true;
        bufferline = "multiple";
        end-of-line-diagnostics = "hint";
      };
      editor.cursor-shape = { insert = "bar"; };
      editor.file-picker = { hidden = false; };
      editor.lsp = {
        display-messages = true;
        display-inlay-hints = true;
      };
      editor.inline-diagnostics = {
        cursor-line = "hint";
        other-lines = "warning";
      };
    };
  };

}
