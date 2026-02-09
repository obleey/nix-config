{
  pkgs,
  user,
  hostname,
  ...
}:
{
  imports = [
    ../../common/nix-settings
    ../../common/nix-settings/darwin.nix
    ./defaults.nix
    ./homebrew.nix
  ];

  # Use the variable passed from flake.nix

  system.primaryUser = user;

  users.users.${user} = {
    name = user;
    home = "/Users/${user}";
  };

  # Networking
  networking.hostName = hostname;
  networking.computerName = hostname;

  # System-wide packages
  environment.systemPackages = with pkgs; [
    vim
    git
    nil
    nixfmt
    aerospace
    nerd-fonts.jetbrains-mono
  ];

  programs.zsh.enable = true;
  # Ensure unfree software (like Cursor/Vivaldi) is allowed
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = 5;
}
