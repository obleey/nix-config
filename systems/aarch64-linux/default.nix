# systems/aarch64-linux/default.nix
{ pkgs, ... }: {
  imports = [
    ../../common/nix-settings        # Universal (Same as Mac!)
    ../../common/nix-settings/linux.nix # Linux-specific tweaks
  ];
  # Linux specific logic (bootloader, hardware-config, etc.)
}