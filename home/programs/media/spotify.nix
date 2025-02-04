{ pkgs, inputs, ... }: {

  imports = [ inputs.spicetify-nix.homeManagerModules.default ];

  programs.spicetify =
    let spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
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
