{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [

    # Compilers
    clang
    gcc
    gfortran

    # Command runner
    gnumake
    cmake

    # Libraries
    libtool

  ];

}
