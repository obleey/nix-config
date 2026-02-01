{ pkgs }:
{
  # 1. Core tools for everyone
  shared = with pkgs; [
    fd
    dust
  ];

  # 2. Must exist, even if empty!
  personal = with pkgs; [
    ansible
    kubectl
    k9s
    kubectx
    kubernetes-helm
    minikube
    opentofu
    mas
  ];

  # 3. Must exist, even if empty!
  work = with pkgs; [
    terraform
  ];
}
