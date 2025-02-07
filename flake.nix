{

  description = "evf's dotfiles";

  inputs = {

    # NixOS unstable
    nixpkgs.url = "nixpkgs/nixos-unstable";

    # Home Manager
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Nix Index Database
    nix-index-database.url = "github:nix-community/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";

    # Spicetify
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, home-manager, nix-index-database, spicetify-nix
    , ... }@inputs:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      pkgs = import nixpkgs {
        inherit system;
        config = { allowUnfree = true; };
      };
    in {

      nixosConfigurations = {

        GLaDOS = lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = [ ./system/hosts/GLaDOS/configuration.nix ];
        };

        tardis = lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = [ ./system/hosts/tardis/configuration.nix ];
        };

      };

      homeConfigurations.evf = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { inherit inputs; };
        modules = [

          ./home/home.nix

        ];
      };

    };

}

