{ ... }: {
  security.pam.services.sudo_local.touchIdAuth = true;

  environment.etc."ghostty/config".text = ''
    theme = catppuccin-macchiato
    font-size = 14
    macos-option-as-alt = true
  '';

  system.defaults = {
    dock = {
      autohide = true;
      show-recents = false;
      persistent-apps = [
        "/System/Applications/Messages.app"
        "/System/Library/CoreServices/Finder.app"
        "/System/Applications/App Store.app"
      ];
    };
    
    # Use CustomUserPreferences for keys not explicitly in nix-darwin
    CustomUserPreferences = {
      "com.apple.finder" = {
        ShowRecentTags = false;
      };
    };

    NSGlobalDomain = {
      AppleShowAllExtensions = true;
    };
  };
}
