{ config, pkgs, ... }: {

  programs.fastfetch = {
    enable = true;
    settings = {
      "$schema" = "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json";
      logo = {
        # type = "small";
        padding = {
          top = 2;
          left = 2;
        };
      };
      display = {
        color = {
          keys = "green";
          title = "blue";
        };
        percent = {
          type = 9;
        };
        separator = " 󰁔 ";
      };
      modules =
        [
          {
            type = "title";
            key = " ╭─  ";
            keyColor = "cyan";
            color = {
              user = "magenta";
              host = "blue";
            };
          }
          {
            type = "os";
            key = " ├─  ";
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
