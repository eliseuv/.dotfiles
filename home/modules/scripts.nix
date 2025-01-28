{ ... }: {

  home.file.".local/bin/nixos-rebuild.sh".source = ../../nixos-rebuild.sh;

  home.sessionPath = [ "$HOME/.local/bin" ];

}
