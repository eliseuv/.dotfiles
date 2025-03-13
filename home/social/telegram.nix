{ pkgs, ... }: {

  home.packages = with pkgs; [

    telegram-desktop

    # TUI client
    nchat

  ];

}
