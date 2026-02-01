{ ... }: {
  programs.git = {
    enable = true;

    # Modern settings structure
    settings = {
      user = {
        name = "Miha Oblišar";
        email = "miha.oblishar@gmail.com";
      };
      init = {
        defaultBranch = "main";
      };
      push = {
        autoSetupRemote = true;
      };
    };
    ignores = [ ".DS_Store" "thumbs.db" ];
  };
}
