{ ... }: {
  programs.vscode.profiles.default.userSettings = {
    # --- UPDATE MANAGEMENT (Nix is the boss now) ---
    "update.mode" = "none";
    "update.showReleaseNotes" = false;
    "extensions.autoCheckUpdates" = false;
    "extensions.autoUpdate" = false;

    # --- APPEARANCE & FONTS ---
    "workbench.colorTheme" = "Catppuccin Macchiato";
    "workbench.iconTheme" = "catppuccin-macchiato";
    "editor.fontSize" = 14;
    "editor.fontFamily" = "'JetBrainsMono Nerd Font', monospace";
    
    # --- NIX DEVELOPMENT ---
    "nix.enableLanguageServer" = true;
    "nix.serverPath" = "nil";
    "nix.formatterPath" = "nixpkgs-fmt";
  };
}