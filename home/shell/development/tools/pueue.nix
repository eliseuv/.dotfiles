{ ... }: {

  services.pueue = {
    enable = true;
    settings = {
      client = { dark_mode = true; };
      # TODO: Make it dependent on host
      daemon = { default_parallel_tasks = 2; };
    };
  };

}
