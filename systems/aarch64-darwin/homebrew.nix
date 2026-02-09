{ ... }:
{
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
      "raycast"
      "lunar"
      "startupfolder"
      "bartender"
    ];
    masApps = {
      # "Magnet" = 441258766;
    };
  };
}
