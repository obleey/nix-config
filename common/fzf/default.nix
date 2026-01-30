{ pkgs, ... }: {
  imports = [ ./colors.nix ];

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    
    # Using 'fd' for speed and to respect .gitignore
    defaultCommand = "fd --type f --strip-cwd-prefix --hidden --follow --exclude .git";
    fileWidgetCommand = "fd --type f --strip-cwd-prefix --hidden --follow --exclude .git";
    
    # Optional: Add default options like layout
    defaultOptions = [
      "--height 40%"
      "--border"
      "--layout=reverse"
    ];
  };
}
