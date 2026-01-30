{ pkgs }: {
  # 1. Core tools for everyone
  shared = with pkgs; [
    eza
    bat
    ripgrep
    fd
    jq
    zoxide
    starship
  ];

  # 2. Must exist, even if empty!
  personal = with pkgs; [
    kubectl
    k9s
    opentofu
   ]; 

  # 3. Must exist, even if empty!
  work = with pkgs; [ 
    terraform
  ];
}