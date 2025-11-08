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

}
