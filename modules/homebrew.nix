{ ... }: {
  homebrew = {
    enable = true;
    onActivation.cleanup = "zap"; # Semicolon added here
    taps = [ "homebrew/cask" ];
    casks = [
      "vivaldi"
      "ghostty"
    ];
    brews = [ "defaultbrowser" ]; # Utility to script the browser change
  };
}