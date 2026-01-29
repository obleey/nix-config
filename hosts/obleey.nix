{ pkgs, ... }: {
  # Import the shared logic
  imports = [
    ../modules/core.nix
    ../modules/macos.nix
  ];

  # --- ADD THIS LINE ---
  system.primaryUser = "obleey";

  # Host-specific settings
  networking.hostName = "obleey";
  nixpkgs.hostPlatform = "aarch64-darwin";

  # Define the user
  users.users.obleey = {
    name = "obleey";
    home = "/Users/obleey";
  };

  # Backwards compatibility
  system.stateVersion = 6;
}
