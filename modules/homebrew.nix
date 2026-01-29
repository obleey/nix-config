{ ... }: {
  homebrew = {
    enable = true;
    onActivation.cleanup = "zap"; 
    taps = []; 

    casks = [
      "vivaldi"
      "ghostty"
    ];
    masApps = {
      "Magnet" = 441258766;
    };
  };
}