{ ... }: {

  virtualisation.docker = {

    enable = true;

    rootless = {
      enable = true;
      setSocketVariable = true;

      daemon.settings = {
        userland-proxy = false;
        experimental = true;
        live-restore = true;
        metrics-addr = "0.0.0.0:9323";
        fixed-cidr-v6 = "fd00::/80";
        ipv6 = true;
      };

    };

  };

  # users.groups.docker.members = [ "evf" ];

}
