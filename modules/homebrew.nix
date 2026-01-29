{ ... }: {
  homebrew = {
    enable = true;
    onActivation.cleanup = "zap"
    taps = [ "homebrew/cask" ];
    casks = [
      "vivaldi"
      "ghostty"
    ];
  };
}