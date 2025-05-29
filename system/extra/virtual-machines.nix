{ pkgs, ... }:
{

  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        # QEMU KVM emulates only host arch
        package = pkgs.qemu_kvm;
        # OVMF
        ovmf = {
          enable = true;
          packages = [ pkgs.OVMFFull.fd ];
        };
        # TPM Emulation
        swtpm.enable = true;
      };
      # NSS
      nss.enable = true;
    };
    spiceUSBRedirection.enable = true;
  };

  programs.virt-manager.enable = true;

  environment.systemPackages = with pkgs; [

    # Templates
    quickemu

  ];

}
