{ ... }:
{

  programs.chromium = {
    enable = true;
    extensions = [
      "chlffgpmiacpedhhbkiomidkjlcfhogd" # pushbullet
      "mbniclmhobmnbdlbpiphghaielnnpgdp" # lightshot
      "gcbommkclmclpchllfjekcdonpmejbdp" # https everywhere
      "cjpalhdlnbpafiamejdnhcphjbkeiagm" # ublock origin
    ];
  };

}
