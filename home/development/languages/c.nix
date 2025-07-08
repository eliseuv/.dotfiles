{ pkgs, ... }:
{

  home.packages = with pkgs; [

    # LLVM tools for C/C++ development
    clang
    clang-tools
    clang-manpages
    clang-analyzer

    # Compilation database
    bear

    # Debuggers
    gdb
    lldb
    gf

  ];

}
