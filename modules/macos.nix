{ ... }: {
  security.pam.services.sudo_local.touchIdAuth = true;

  system.defaults = {
    dock = {
      autohide = true;
      # This clears the dock and adds only what you want
      persistent-apps = [
        "/System/Applications/Messages.app"
        "/System/Library/CoreServices/Finder.app"
        "/System/Applications/App Store.app"
      ];
      show-recents = false;
    };
    # Mission Control settings
    dock.mru-spaces = false; # Don't rearrange spaces based on use
  };
}
