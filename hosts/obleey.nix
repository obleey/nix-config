{ pkgs, ... }: {
  imports = [
    ../modules/core.nix
    ../modules/macos.nix
  ];

  # Enable Homebrew management
  homebrew = {
    enable = true;
    onActivation.cleanup = "zap"; # Removes apps not listed here
    casks = [
      "ghostty"
    ];
  };

  system.primaryUser = "obleey";
  networking.hostName = "obleey";
  nixpkgs.hostPlatform = "aarch64-darwin";
  users.users.obleey = {
    name = "obleey";
    home = "/Users/obleey";
  };
  system.stateVersion = 6;
}
