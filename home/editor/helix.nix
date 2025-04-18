{ pkgs, lib, ... }:
{

  programs.helix = {
    enable = true;
    settings = {
      theme = "tokyonight";
      editor = {
        mouse = false;
        line-number = "relative";
        idle-timeout = 50;
        completion-timeout = 50;
        completion-replace = true;
        true-color = true;
        bufferline = "multiple";
        end-of-line-diagnostics = "hint";
        cursor-shape = {
          insert = "bar";
        };
        file-picker = {
          hidden = false;
        };
        lsp = {
          display-messages = true;
          display-inlay-hints = true;
        };
        inline-diagnostics = {
          cursor-line = "hint";
          other-lines = "warning";
        };
      };
    };
    languages = {
      # Python
      language-server.ruff = {
        command = "${lib.getExe pkgs.ruff}";
        args = [ "server" ];
      };
      language-server.basedpyright = {
        command = "${pkgs.basedpyright}/bin/basedpyright-langserver";
      };
      language = [
        {
          name = "python";
          language-servers = [
            "ruff"
            "basedpyright"
          ];
          auto-format = true;
        }
      ];
    };
  };

}
