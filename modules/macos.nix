{ ... }: {
  security.pam.services.sudo_local.touchIdAuth = true;
  
  system.defaults = {
    finder = {
      FXPreferredViewStyle = "clmv"; 
      _FXShowPosixPathInTitle = true;
    };

    dock = {
      autohide = false;
      show-recents = false;
      persistent-apps = [
        "/System/Applications/Messages.app"
        "/System/Applications/App Store.app"
        "/Applications/Nix Apps/Visual Studio Code.app"
      ];
    };

    # This handles the system-level "Default Browser" preference
    CustomUserPreferences = {
      "com.apple.coreservices.userappbindings" = {
        LSHandlers = [
          {
            LSHandlerURLScheme = "http";
            LSHandlerRoleAll = "com.vivaldi.Vivaldi";
          }
          {
            LSHandlerURLScheme = "https";
            LSHandlerRoleAll = "com.vivaldi.Vivaldi";
          }
        ];
      };
    };

    NSGlobalDomain = {
      AppleShowAllExtensions = true;
    };
  };

  # THE "NUDGE": This script forces Vivaldi as default via CLI
  system.activationScripts.postUserActivation.text = ''
    echo "Ensuring Vivaldi is the default browser..."
    /opt/homebrew/bin/defaultbrowser vivaldi
  '';
}