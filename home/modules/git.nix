{ config, pkgs, ... }: {

  programs.git = {
    enable = true;
    userName = "evf";
    userEmail = "eliseuv816@gmail.com";
    delta.enable = true;
  };
  home.shellAliases = {
    git-push = ''git add .; git commit -m "update"; git push'';
  };

}
