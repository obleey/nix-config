{
  config,
  pkgs,
  lib,
  ...
}:

let
  catppuccin-ghostty = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "ghostty";
    rev = "main"; # Use main branch
    hash = "sha256-Y6RFften1/6+1xdhIzEh/E7FBJTwY5a8NH4301HbgOM="; # Placeholder - see note below
  };
in
{
  programs.ghostty = {
    enable = true;
    package = null;

    settings = {
      theme = "catppuccin-macchiato.conf";
      font-family = "JetBrainsMono Nerd Font";
      font-size = 14;
      window-padding-x = 10;
      window-padding-y = 10;
      macos-option-as-alt = false;
    };
  };

  # Link the themes from the fetched source
  xdg.configFile."ghostty/themes".source = "${catppuccin-ghostty}/themes";
}
