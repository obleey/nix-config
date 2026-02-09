{
  user,
  hostname,
  lib,
  ...
}:
{
  imports = [ ../../systems/aarch64-darwin/default.nix ];

  networking.hostName = hostname;

  system.defaults.dock.persistent-apps = lib.mkAfter [
    "/Applications/Cursor.app"
    "/Applications/Visual Studio Code.app"
    "/Applications/Slack.app"
    "/Applications/Discord.app"
    "/Applications/Spotify.app"
    "/Applications/Ableton Live 12 Standard.app"
    "/Applications/Reaper.app"
  ];

  programs._1password.enable = true;

  homebrew = {
    enable = true;
    # taps = [
    #   "nikitabobko/tap"
    # ];
    casks = [
      "1password" # Personal only
      "1password-cli"
      "spotify"
      "slack"
      "discord"
      "appcleaner"
      "ableton-live-standard"
      "ableset"
      "reaper"
      "logi-options+"
      # "nikitabobko/tap/aerospace"
    ];
    masApps = {
      "Xnip" = 1221250572;
      "Amphetamine" = 937984704;
    };
  };

  system.defaults.CustomUserPreferences = {
    "com.apple.symbolichotkeys" = {
      AppleSymbolicHotKeys = {
        # 64 is the shortcut for Spotlight search (Cmd+Space)
        "64" = {
          enabled = false;
        };
        # 65 is the shortcut for Spotlight Finder window (Cmd+Opt+Space)
        "65" = {
          enabled = false;
        };
      };
    };
  };
}
