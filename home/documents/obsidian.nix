{ ... }:
{

  programs.obsidian = {
    enable = true;
    defaultSettings = {
      app = {
        "vimMode" = true;
      };
      appearance = {
        "theme" = "obsidian";
        "cssTheme" = "Minimal";
      };
    };
    vaults = {
      notes = {
        target = "Documents/obsidian";
      };
    };
  };

}
