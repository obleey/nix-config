{ pkgs }:
{
  # 1. Core tools for everyone
  shared = with pkgs; [
    eza
    bat
    ripgrep
    fd
    jq
    zoxide
    starship
    mas
  ];

  # 2. Must exist, even if empty!
  personal = with pkgs; [
    ansible
    kubectl
    k9s
    kubernetes-helm
    minikube
    opentofu
  ];

  # 3. Must exist, even if empty!
  work = with pkgs; [
    terraform
  ];
}
