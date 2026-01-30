{ pkgs, ... }: {
  imports = [
    ../../common/nix-settings           # Universal
    ../../common/nix-settings/darwin.nix  # Mac-specific Nix settings
    ./defaults.nix                       # Mac System Prefs
    ./homebrew.nix                       # Mac GUI Apps
    ./homebrew.nix
  ];

  # This file stays focused ONLY on macOS core logic
  services.nix-daemon.enable = true;
  programs.zsh.enable = true;
  system.stateVersion = 5;
}