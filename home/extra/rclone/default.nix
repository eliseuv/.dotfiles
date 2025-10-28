{ ... }:
{

  imports = [

    # Sync Books
    ./services/rclone-sync-books.nix

  ];

  programs.rclone = {
    enable = true;
  };

}
