{ pkgs, ... }: {
  home.stateVersion = "24.11"; 

  # --- GHOSTTY CONFIG ---
  home.file.".config/ghostty/config".text = ''
    theme = catppuccin-macchiato
    font-family = "JetBrainsMono Nerd Font"
    font-size = 14
    window-padding-x = 10
    window-padding-y = 10
    macos-option-as-alt = true
  '';

  # --- GIT ---
  programs.git = {
    enable = true;
    userName = "Miha Oblišar"; # Note: standard HM use userName/userEmail
    userEmail = "miha.oblishar@gmail.com";
  };

  # --- VS CODE ---
  programs.vscode = {
    enable = true;
    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        bbenoist.nix
        catppuccin.catppuccin-vsc
        catppuccin.catppuccin-vsc-icons
        ms-azuretools.vscode-docker
        ms-kubernetes-tools.vscode-kubernetes-tools
        ms-vscode-remote.vscode-remote-extensionpack
        jnoortheen.nix-ide
      ];
      userSettings = {
        "workbench.colorTheme" = "Catppuccin Macchiato";
        "workbench.iconTheme" = "catppuccin-macchiato";
        "editor.fontSize" = 14;
        "editor.fontFamily" = "'JetBrainsMono Nerd Font', monospace";
        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "nil";
      };
    };
  };

  # --- ZSH ---
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ls = "eza --icons --git --group-directories-first";
      ll = "eza -lh --icons --git --group-directories-first";
      la = "eza -a --icons --git --group-directories-first";
      cat = "bat";
      grep = "rg";
      nix-switch = "sudo darwin-rebuild switch --flake ~/nix-darwin-config#obleey";
      nix-clean = "nix-collect-garbage -d";
      nix-conf = "code ~/nix-darwin-config";
    };
  };
}