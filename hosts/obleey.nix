{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [
     raycast
    _1password-gui 
    _1password-cli
    mas
  ];
  imports = [
    ../modules/core.nix
    ../modules/macos.nix
    ../modules/home.nix
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
