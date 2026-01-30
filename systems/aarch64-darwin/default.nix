{ pkgs, ... }: {
  imports = [
    ../../common/nix-settings
    ../../common/nix-settings/darwin.nix
    ../../common/packages.nix
    ./defaults.nix
    ./homebrew.nix
  ];

  # NEW: Required by newer nix-darwin versions for your Dock/Finder settings
  system.primaryUser = "obleey";

  users.users.obleey = {
    name = "obleey";
    home = "/Users/obleey";
  };

  # REMOVED: services.nix-daemon.enable (nix-darwin now does this automatically)

  environment.systemPackages = with pkgs; [
    vim
    git
    k9s
    opentofu
    nerd-fonts.jetbrains-mono
  ];

  programs.zsh.enable = true;
  system.stateVersion = 5;
}