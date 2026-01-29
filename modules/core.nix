{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = "nix-command flakes";
  
  environment.systemPackages = with pkgs; [
    vim git htop kubectl opentofu raycast ghostty
  ];

  programs.zsh.enable = true;
}
