{ ... }:
{

  programs.zathura = {
    enable = true;
    mappings = {
      "<C-i>" = "recolor";
    };
    options = {
      recolor = true;
    };
  };

  home.sessionVariables.READER = "zathura";

}
