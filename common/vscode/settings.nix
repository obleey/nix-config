{ ... }:
{
  programs.vscode.profiles.default.userSettings = {
    # --- UPDATE MANAGEMENT ---
    "update.mode" = "none";
    "update.showReleaseNotes" = false;
    "extensions.autoCheckUpdates" = false;
    "extensions.autoUpdate" = false;

    # --- APPEARANCE & FONTS ---
    "workbench.colorTheme" = "Bearded Theme Aquarelle Hydrangea";
    "workbench.iconTheme" = "bearded-icons";
    "editor.fontSize" = 14;
    "editor.fontFamily" = "'JetBrainsMono Nerd Font', monospace";

    "editor.formatOnSave" = true;

    # --- NIX DEVELOPMENT ---
    "nix.enableLanguageServer" = true;
    "nix.serverPath" = "nil";
    "nix.formatterPath" = "nixpkgs-fmt";
    "[nix]" = {
      "editor.defaultFormatter" = "jnoortheen.nix-ide";
      "editor.formatOnSave" = true;
    };
  };
}
