{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;
  
  nixpkgs.config.allowUnsupportedSystem = true; 

  environment.systemPackages = with pkgs; [
    vim
    git
    htop
    kubectl
    opentofu
    vscode
    eza
    bat
    ripgrep
  ];

  nix.settings.experimental-features = "nix-command flakes";
  programs.zsh.enable = true;
}
