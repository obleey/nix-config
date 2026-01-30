{ ... }: {
  # Enable TouchID for sudo (Mac hardware specific)
  security.pam.services.sudo_local.touchIdAuth = true;
  
  system.defaults = {
    NSGlobalDomain.AppleShowAllExtensions = false;
    finder = {
      FXPreferredViewStyle = "clmv"; 
      _FXShowPosixPathInTitle = true;
      AppleShowAllExtensions = false;
    };

    dock = {
      enable-spring-load-actions-on-all-items = true;
      mineffect = "genie";
      minimize-to-application = true;
      magnification = true;
      largesize = 88;
      tilesize = 64;
      orientation = "bottom";
      showhidden = true;
      launchanim = true;
      autohide = false;
      show-recents = false;
      mru-spaces = false; 

      persistent-apps = [
        "/Applications/Vivaldi.app"      
        "/Applications/Visual Studio Code.app"
        "/System/Applications/App Store.app"
        "/System/Applications/Messages.app"
        "/Applications/Ghostty.app"
      ];
    };

    CustomUserPreferences = {
      "com.apple.coreservices.userappbindings" = {
        LSHandlers = [
          { LSHandlerURLScheme = "http"; LSHandlerRoleAll = "com.vivaldi.Vivaldi"; }
          { LSHandlerURLScheme = "https"; LSHandlerRoleAll = "com.vivaldi.Vivaldi"; }
          { LSHandlerContentType = "public.unix-executable"; LSHandlerRoleAll = "com.mitchellh.ghostty"; }
          { LSHandlerContentType = "public.shell-script"; LSHandlerRoleAll = "com.mitchellh.ghostty"; }
        ];
      };
      "com.apple.loginitems.plist" = {
        SessionItems = {
          CustomList = [
            { Name = "OrbStack"; Path = "/Applications/OrbStack.app"; }
            { Name = "Raycast"; Path = "/Applications/Raycast.app"; }
          ];
        };
      };
    };
  };
}