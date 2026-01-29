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
      static-only = false;
      persistent-apps = [
        "/System/Applications/Messages.app"
        "/System/Applications/App Store.app"
      ];
      persistent-others = [];
    };

    CustomUserPreferences = {
      "com.apple.finder" = {
        ShowRecentTags = false;
        FXPreferredGroupBy = "Kind";
      };
      "com.apple.dock" = {
        show-recents = false;
        "recent-apps" = [];
        "recent-documents" = [];
        "recent-servers" = [];
      };
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
}
