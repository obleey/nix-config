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
  ];

  homebrew = {
    enable = true;
    casks = [
      "raycast"
      "1password" # Personal only
      "1password-cli"
      "spotify"
      "slack"
      "discord"
    ];
    masApps = {
      "Xnip" = 1221250572;
    };
  };

  launchd.user.agents = {
    xnip = {
      serviceConfig = {
        ProgramArguments = [
          "/usr/bin/open"
          "-g"
          "-a"
          "Xnip"
        ];
        RunAtLoad = true;
        ProcessType = "Interactive";
      };
    };

    "1password" = {
      serviceConfig = {
        ProgramArguments = [
          "/usr/bin/open"
          "-g"
          "-a"
          "1Password"
        ];
        RunAtLoad = true;
        ProcessType = "Interactive";
      };
    };

    raycast = {
      serviceConfig = {
        ProgramArguments = [
          "/usr/bin/open"
          "-g"
          "-a"
          "Raycast"
        ];
        RunAtLoad = true;
        ProcessType = "Interactive";
      };
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
