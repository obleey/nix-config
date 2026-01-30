{ hostname, lib, ... }:
{
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
      persistent-apps = [
        "/Applications/Vivaldi.app"
        "/Applications/Ghostty.app"
      ];

    };

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
          {
            LSHandlerContentType = "public.unix-executable";
            LSHandlerRoleAll = "com.mitchellh.ghostty";
          }
          {
            LSHandlerContentType = "public.shell-script";
            LSHandlerRoleAll = "com.mitchellh.ghostty";
          }
        ];
      };
    };
  };
  system.defaults.menuExtraClock.Show24Hour = true;
  system.defaults.NSGlobalDomain."com.apple.mouse.tapBehavior" = 1;
}
