{ pkgs, ... }: {
  # This value determines the Home Manager release that your configuration is
  # compatible with. 
  home.stateVersion = "24.11"; 

  # Manage Git via Home Manager
  programs.git = {
    enable = true;
    userName = "Miha Oblišar";
    userEmail = "your.email@example.com";
  };

  # Manage VS Code Extensions via Nix!
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      bbenoist.nix
      catppuccin.catppuccin-vsc
      catppuccin.catppuccin-vsc-icons
      jnoortheen.nix-ide
    ];
    userSettings = {
      "workbench.colorTheme" = "Catppuccin Macchiato";
      "editor.fontSize" = 14;
      "editor.fontFamily" = "JetBrains Mono";
    };
  };
}