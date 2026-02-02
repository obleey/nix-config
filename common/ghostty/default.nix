{
  ...
}:

{
  programs.ghostty = {
    enable = true;
    package = null; # Keeps it from breaking on macOS

    settings = {
      theme = "Catppuccin Macchiato";
      font-family = "JetBrainsMono Nerd Font";
      font-size = 14;
      window-padding-x = 10;
      window-padding-y = 10;
      macos-option-as-alt = false;
    };
  };
}
