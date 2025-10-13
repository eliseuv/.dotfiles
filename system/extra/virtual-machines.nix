{ pkgs, ... }:
{

  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        # QEMU KVM emulates only host arch
        package = pkgs.qemu_kvm;
        # TPM Emulation
        swtpm.enable = true;
      };
    };
    spiceUSBRedirection.enable = true;
  };

  programs.virt-manager.enable = true;

  environment.systemPackages = with pkgs; [

    # Templates
    quickemu

  ];

}
