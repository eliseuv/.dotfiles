{ ... }:
{

  imports = [

    # GnuPG
    ./gpg.nix

    # SSH
    ./ssh.nix

    # Standard Unix Password Manager
    ./password-store.nix

    # SOPS
    ./sops.nix

  ];

}
