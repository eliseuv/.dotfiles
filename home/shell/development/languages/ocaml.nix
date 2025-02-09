{ pkgs, ... }: {

  home.packages = with pkgs;
    [
      # Package manager
      opam
    ];

}
