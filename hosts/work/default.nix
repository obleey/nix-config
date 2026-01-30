{ user, hostname, ... }: {
  imports = [ ../../systems/aarch64-darwin/default.nix ];

  networking.hostName = hostname;

  homebrew = {
    enable = true;
    casks = [
      "zoom"           # Work only
      "microsoft-teams"
    ];
  };
}