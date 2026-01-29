{ ... }: {
  security.pam.services.sudo_local.touchIdAuth = true;
  
  system.defaults = {
    finder = {
      FXPreferredViewStyle = "clmv"; 
      _FXShowPosixPathInTitle = true;
      AppleShowAllExtensions = false;
      AppleShowAllFiles = false;   
    };

    dock = {
      autohide = false;
      show-recents = false;
      persistent-apps = [
        "/System/Applications/Vivaldi.app"      
        "/Applications/Nix Apps/Visual Studio Code.app"
        "/System/Applications/App Store.app"
        "/System/Applications/Messages.app"
        "/Applications/Ghostty.app"
      ];
    };

    # The declarative way to set URL handlers
    CustomUserPreferences = {
      "com.apple.coreservices.userappbindings" = {
        LSHandlers = [
          { LSHandlerURLScheme = "http"; LSHandlerRoleAll = "com.vivaldi.Vivaldi"; }
          { LSHandlerURLScheme = "https"; LSHandlerRoleAll = "com.vivaldi.Vivaldi"; }
          { LSHandlerContentType = "public.unix-executable"; LSHandlerRoleAll = "com.mitchellh.ghostty"; }
          { LSHandlerContentType = "public.shell-script"; LSHandlerRoleAll = "com.mitchellh.ghostty"; }
        ];
      };
    };
  };
};
