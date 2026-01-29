{ ... }: {
  homebrew = {
    enable = true;
    onActivation.cleanup = "zap"; 
    taps = []; 

    casks = [
      "vivaldi"
      "ghostty"
    ];
  };
}