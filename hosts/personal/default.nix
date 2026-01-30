{ user, hostname, lib, ... }: {
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
      "1password"      # Personal only
      "1password-cli"
      "spotify"
      "slack"
      "discord"
    ];
  };
}