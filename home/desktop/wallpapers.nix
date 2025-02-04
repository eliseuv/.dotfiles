{ ... }: {

  # Copy wallpapers
  home.file.".wallpapers" = {
    source = ../../resources/wallpapers;
    recursive = true;
  };

}
