{ pkgs, ... }: {
  # Install the 'mas' CLI tool so Nix can talk to the App Store
  environment.systemPackages = [ pkgs.mas ];

  homebrew = {
    enable = true;
    
    onActivation = {
      cleanup = "zap";      # Uninstalls anything not listed here
      autoUpdate = true;   # Update Homebrew and all formulae
      upgrade = true;      # Upgrade all installed casks
    };

    taps = []; 

    # GUI Apps from Homebrew
    casks = [
      "vivaldi"
      "ghostty"
      "orbstack"
      "visual-studio-code"
      "1password"
      "1password-cli"
      "cursor"
    ];

    # Apps from the Mac App Store
    masApps = {
      "Magnet" = 441258766;
    };
  };
}
