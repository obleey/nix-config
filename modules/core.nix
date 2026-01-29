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
    nerd-fonts.jetbrains-mono
    starship
  ];

  nix.settings = {
      experimental-features = [ "nix-command" "flakes" ];
      extra-platforms = [ "x86_64-darwin" "aarch64-darwin" ];
  };
  programs.zsh.enable = true;
}
