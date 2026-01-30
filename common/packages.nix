{ pkgs, ... }: {
  # System-wide packages (installed for all users)
  environment.systemPackages = with pkgs; [
    bat        
    eza        
    fd         
    ripgrep   
    zoxide     
    fzf
    ripgrep        
    nil        
    nixpkgs-fmt 
  ];
}
