{ ... }: {

  programs.gitui = { enable = true; };
  home.shellAliases.gg = "gitui";

}
