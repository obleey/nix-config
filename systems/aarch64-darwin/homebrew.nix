{ hostname, ... }: {
  homebrew = {
    enable = true;
    onActivation = {
      cleanup = "zap"; 
      autoUpdate = true;
      upgrade = true;
    };

    casks = [
      "vivaldi"
      "ghostty"
      "orbstack"
      "cursor"
      "visual-studio-code"
    ] 
    ++ (if hostname == "obleey" then [
      "1password"      # Personal only
      "1password-cli"  # Personal only
    ] else [
      "slack"          # Work only
      "zoom"           # Work only
    ]);

    masApps = {
      "Magnet" = 441258766;
    };
  };
}