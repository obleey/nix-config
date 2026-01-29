{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;
  
  # --- ADD THIS LINE ---
  nixpkgs.config.allowUnsupportedSystem = true; 

  environment.systemPackages = with pkgs; [
    vim
    git
    htop
    kubectl
    opentofu
    raycast
  ];

  nix.settings.experimental-features = "nix-command flakes";
  programs.zsh.enable = true;
}
