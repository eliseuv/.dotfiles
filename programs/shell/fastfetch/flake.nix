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
          top = 2;
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
        {
          type = "title";
          color = {
            user = "magenta";
            host = "blue";
          };
        }
        "break"
        {
          type = "os";
          key = " ╭─  ";
          keyColor = "cyan";
        }
        {
          type = "kernel";
          key = " ├─  ";
          keyColor = "cyan";
        }
        {
          type = "packages";
          key = " ├─  ";
          keyColor = "cyan";
        }
        {
          type = "wm";
          key = " ├─  ";
          keyColor = "cyan";
        }
        {
          type = "terminal";
          key = " ├─  ";
          keyColor = "cyan";
        }
        {
          type = "shell";
          key = " ╰─  ";
          keyColor = "cyan";
        }
        "break"
        {
          type = "host";
          key = " ╭─  ";
          keyColor = "blue";
        }
        {
          type = "cpu";
          key = " ├─ 󰍛 ";
          keyColor = "blue";
        }
        {
          type = "memory";
          key = " ├─  ";
          keyColor = "blue";
        }
        {
          type = "disk";
          key = " ├─ 󱛟 ";
          keyColor = "blue";
          format = "{name}: {size-total} ({size-percentage})";
        }
        {
          type = "gpu";
          key = " ├─  ";
          keyColor = "blue";
        }
        {
          type = "display";
          key = " ╰─ 󰍹 ";
          keyColor = "blue";
          compactType = "original-with-refresh-rate";
        }
        "break"
      ];
    };
  };

}
