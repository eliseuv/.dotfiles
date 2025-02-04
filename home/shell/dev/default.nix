{pkgs,...}: {

    imports = [ ./c.nix ./fortran.nix ./go.nix ./haskell.nix ./julia.nix ./nix.nix ./ocaml.nix ./python.nix ./rust.nix ./web.nix ./zig.nix ];

}
