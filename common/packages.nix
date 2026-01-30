{ pkgs }: {
  shared = with pkgs; [
    bat eza fd fzf htop jq ripgrep tree zoxide starship
  ];
}