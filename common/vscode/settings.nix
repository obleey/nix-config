{ pkgs, ... }:
{
  programs.vscode.profiles.default.userSettings = {
    # --- CATPPUCCIN RESTORATION ---
    "workbench.colorTheme" = "Bearded Theme feat. Will";
    "workbench.iconTheme" = "BeardedBear.beardedicons";

    # --- NIX & NIL CONFIG ---
    "nix.enableLanguageServer" = true;
    "nix.serverSettings" = {
      "nil" = {
        "formatting" = {
          "command" = [ "nixfmt" ]; # Changed : to =
        };
      }; # Added missing closing brace for nil
    }; # Added missing closing brace for serverSettings

    # --- APPEARANCE & BEHAVIOR ---
    "editor.fontSize" = 14;
    "editor.fontFamily" = "'JetBrainsMono Nerd Font', monospace";
    "editor.formatOnSave" = true;

    # --- UPDATE MANAGEMENT (Nix is the boss) ---
    "update.mode" = "none";
    "update.showReleaseNotes" = false;
    "extensions.autoCheckUpdates" = false;
    "extensions.autoUpdate" = false;

    "[nix]" = {
      "editor.defaultFormatter" = "jnoortheen.nix-ide"; # Fixed the formatter ID
    };
  };
}
