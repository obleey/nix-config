{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;
  
  nixpkgs.config.allowUnsupportedSystem = true; 

  environment.systemPackages = with pkgs; [
    vim
    git
    htop
    kubectl
    opentofu
    raycast
    _1password-gui
    _1password-cli
    vscode
  ];

  nix.settings.experimental-features = "nix-command flakes";
  programs.zsh.enable = true;
}
