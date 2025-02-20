{ ... }: {

  programs.ledger = {
    enable = true;
    settings = {
      sort = "date";
      strict = true;
    };
  };

}
