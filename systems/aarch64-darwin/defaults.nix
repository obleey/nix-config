{ hostname, ... }: {
  security.pam.services.sudo_local.touchIdAuth = true;
  
  system.defaults = {
    NSGlobalDomain = {
      NSAutomaticSpellingCorrectionEnabled = false;
      NSAutomaticCapitalizationEnabled = false;
      NSAutomaticDashSubstitutionEnabled = false;
      NSAutomaticQuoteSubstitutionEnabled = false;
      NSAutomaticPeriodSubstitutionEnabled = false;
      AppleICUForce24HourTime = true;
      AppleInterfaceStyle = "Dark";
      AppleShowAllExtensions = false;
      AppleTemperatureUnit = "Celsius";
    };

    finder = {
      FXPreferredViewStyle = "clmv"; 
      _FXShowPosixPathInTitle = true;
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

      # Dynamic Dock based on machine
      persistent-apps = [
        "/Applications/Vivaldi.app"      
        "/Applications/Cursor.app"
        "/Applications/Visual Studio Code.app"
        "/Applications/Ghostty.app"
        "/System/Applications/Messages.app"
      ] ++ (if hostname == "obleey-work" then [
        "/Applications/Slack.app"
      ] else [
        "/System/Applications/App Store.app"
      ]);
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