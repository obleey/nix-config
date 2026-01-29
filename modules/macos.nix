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
    mineffect = "genie";           # Options: "genie", "scale"
    minimize-to-application = true;
    magnification = true;          # Enables the hover zoom
    largesize = 88;                # How big the icons grow (default is usually 128)
    tilesize = 64;                 # The base size of icons (normal size)
    # Orientation (If you want it on the side)
    orientation = "bottom";        # Options: "bottom", "left", "right"
    # Other visual tweaks
    showhidden = true;             # Transparent icons for hidden apps (very helpful!)
    launchanim = true;
      autohide = false;
      show-recents = false;
      persistent-apps = [
        "/Applications/Vivaldi.app"      
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
      "com.apple.loginitems.plist" = {
        SessionItems = {
          CustomList = [
            {
              Name = "OrbStack";
              Path = "/Applications/OrbStack.app";
            }
            {
              Name = "Raycast";
              Path = "/Applications/Raycast.app";
            }
          ];
        };
      };
    };
  };
}
