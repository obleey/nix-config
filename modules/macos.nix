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

    # The declarative way to set URL handlers
    CustomUserPreferences = {
      "com.apple.coreservices.userappbindings" = {
        LSHandlers = [
          { LSHandlerURLScheme = "http"; LSHandlerRoleAll = "com.vivaldi.Vivaldi"; }
          { LSHandlerURLScheme = "https"; LSHandlerRoleAll = "com.vivaldi.Vivaldi"; }
        ];
      };
    };
  };

  # THE "NUDGE": Fixed for the new nix-darwin version
  system.activationScripts.postActivation.text = ''
    echo "Syncing default browser to Vivaldi..."
    # 'defaultbrowser' is a CLI tool you added to homebrew.nix
    # We run it as your user 'obleey' to satisfy macOS security
    sudo -u obleey /opt/homebrew/bin/defaultbrowser vivaldi
  '';
}