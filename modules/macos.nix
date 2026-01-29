{ ... }: {
  security.pam.services.sudo_local.touchIdAuth = true;

  # --- GHOSTTY CONFIGURATION ---
  environment.etc."ghostty/config".text = ''
    theme = catppuccin-macchiato
    font-size = 14
    macos-option-as-alt = true
    command = /run/current-system/sw/bin/zsh
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
    
    finder = {
      ShowRecentTags = false;
    };

    NSGlobalDomain = {
      AppleShowAllExtensions = true;
      # Disables the "Recent" folders and tracking
      "com.apple.trackpad.scaling" = 3.0; # Example of another tweak you might like
    };
  };
}
