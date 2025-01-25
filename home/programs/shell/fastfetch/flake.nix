{ config, pkgs, ... }: {

  home.file.".config/fastfetch/nixos.png".source = ./nixos.png;
  programs.fastfetch = {
    enable = true;
    settings = {
      "$schema" =
        "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json";
      logo = {
        type = "kitty";
        source = "~/.config/fastfetch/nixos.png";
        padding = {
          top = 1;
          left = 4;
        };
        height = 16;
      };
      display = {
        color = {
          keys = "green";
          title = "blue";
        };
        percent = { type = 9; };
        separator = " 󰁔 ";
      };
      modules = [
        "break"
        {
          type = "title";
          color = {
            user = "cyan";
            at = "blue";
            host = "cyan";
          };
        }
        "break"
        {
          type = "os";
          key = " ╭─  ";
          keyColor = "blue";
        }
        {
          type = "kernel";
          key = " ├─  ";
          keyColor = "blue";
        }
        {
          type = "packages";
          key = " ├─  ";
          keyColor = "blue";
        }
        {
          type = "wm";
          key = " ├─  ";
          keyColor = "blue";
        }
        {
          type = "terminal";
          key = " ├─  ";
          keyColor = "blue";
        }
        {
          type = "shell";
          key = " ╰─  ";
          keyColor = "blue";
        }
        "break"
        {
          type = "host";
          key = " ╭─  ";
          keyColor = "magenta";
        }
        {
          type = "cpu";
          key = " ├─ 󰍛 ";
          keyColor = "magenta";
        }
        {
          type = "memory";
          key = " ├─  ";
          keyColor = "magenta";
        }
        {
          type = "disk";
          key = " ├─ 󱛟 ";
          keyColor = "magenta";
          format = "{name}: {size-total} ({size-percentage})";
        }
        {
          type = "gpu";
          key = " ├─  ";
          keyColor = "magenta";
        }
        {
          type = "display";
          key = " ╰─ 󰍹 ";
          keyColor = "magenta";
          compactType = "original-with-refresh-rate";
        }
        "break"
      ];
    };
  };

}
