{ user, hostname, ... }: {
  imports = [ ../../systems/aarch64-darwin/default.nix ];

  networking.hostName = hostname;

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