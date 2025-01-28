{ ... }: {

  home.file.".local/bin/nixos-rebuild".source = ../../nixos-rebuild.sh;

  home.sessionPath = [ "$HOME/.local/bin" ];

}
