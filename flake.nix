{
  description = "evf's dotfiles";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = { self, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      nixosConfigurations = {
        GLaDOS = lib.nixosSystem {
          inherit system;
          modules = [ ./system/hosts/GLaDOS/configuration.nix ];
        };
        tardis = lib.nixosSystem {
          inherit system;
          modules = [ ./system/hosts/tardis/configuration.nix ];
        };
      };
      homeConfigurations = {
        evf = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./home/flake.nix ];
        };
      };
    };
}

