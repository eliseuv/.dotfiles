{ pkgs, ... }:
{

  home.packages = with pkgs; [

    # LLVM tools for C/C++ development
    clang-tools

    # Debuggers
    gdb
    lldb

  ];

}
