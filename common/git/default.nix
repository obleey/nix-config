{ ... }: {
  programs.git = {
    enable = true;
    userName = "Miha Oblišar";
    userEmail = "miha.oblishar@gmail.com";
    
    extraConfig = {
      init.defaultBranch = "main";
      push.autoSetupRemote = true;
    };

    ignores = [ ".DS_Store" "thumbs.db" ];
  };
}
