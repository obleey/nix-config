{ pkgs, ... }: {
  # System-wide packages (installed for all users)
  environment.systemPackages = with pkgs; [
    bat        # Better cat
    eza        # Better ls
    fd         # Better find
    ripgrep    # Better grep
    zoxide     # Better cd
    fzf        # Fuzzy finder
    nil        # Nix Language Server
    nixpkgs-fmt # Nix formatter
  ];
}
