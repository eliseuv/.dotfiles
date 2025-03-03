{ pkgs, attrs, ... }: {

  imports = [ attrs.spicetify-nix.homeManagerModules.default ];

  programs.spicetify =
    let spicePkgs = attrs.spicetify-nix.legacyPackages.${pkgs.system};
    in {
      enable = true;
      enabledExtensions = with spicePkgs.extensions; [
        adblock
        shuffle
        beautifulLyrics
        hidePodcasts
      ];
      theme = spicePkgs.themes.catppuccin;
      colorScheme = "mocha";
    };

}
