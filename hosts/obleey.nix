{ pkgs, ... }: {
  imports = [
    ../modules/core.nix
    ../modules/macos.nix
  ];


  system.primaryUser = "obleey";
  networking.hostName = "obleey";
  nixpkgs.hostPlatform = "aarch64-darwin";
  users.users.obleey = {
    name = "obleey";
    home = "/Users/obleey";
  };
  system.stateVersion = 6;
}
