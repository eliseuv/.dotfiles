{ ... }: {

  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    autosuggestion = {
      enable = true;
      strategy = [ "history" "completion" ];
    };
    enableVteIntegration = true;
    defaultKeymap = "emacs";
    history = {
      append = true;
      expireDuplicatesFirst = true;
      ignoreAllDups = true;
      ignoreSpace = true;
      save = 1000000;
      size = 1000000;
    };
    initExtra = ''
      bindkey '^ ' autosuggest-accept
      bindkey  "^[[H"   beginning-of-line
      bindkey  "^[[F"   end-of-line
      bindkey  "^[[3~"  delete-char

      fastfetch
    '';

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
    };
  };

}
