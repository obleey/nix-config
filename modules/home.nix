{ pkgs, ... }: {
  home.stateVersion = "24.11"; 


  # --- GHOSTTY CONFIG ---
  home.file.".config/ghostty/config".text = ''
    # Manually defining Catppuccin Macchiato colors
    palette = 0=#494d64
    palette = 1=#ed8796
    palette = 2=#a6da95
    palette = 3=#eed49f
    palette = 4=#8aadf4
    palette = 5=#f5bde6
    palette = 6=#8bd5ca
    palette = 7=#b8c0e0
    palette = 8=#5b6078
    palette = 9=#ed8796
    palette = 10=#a6da95
    palette = 11=#eed49f
    palette = 12=#8aadf4
    palette = 13=#f5bde6
    palette = 14=#8bd5ca
    palette = 15=#a5adcb
    background = #24273a
    foreground = #cad3f5
    cursor-color = #f4dbd6
    selection-background = #44475a
    selection-foreground = #cad3f5

    font-family = "JetBrainsMono Nerd Font"
    font-size = 14
    window-padding-x = 10
    window-padding-y = 10
    macos-option-as-alt = true
  '';

  # --- GIT ---
  programs.git = {
    enable = true;
    # Moving these into 'settings' to silence the warnings
    settings = {
      user = {
        name = "Miha Oblišar";
        email = "miha.oblishar@gmail.com";
      };
      # Pro-tip: you can add other git settings here too
      init = {
        defaultBranch = "main";
      };
    };
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

  programs.starship = {
    enable = true;
    # Custom settings for Starship
    settings = {
      add_newline = false;
      # This layout shows: [Directory] [Git] [K8s] [Terraform] [Prompt Character]
      format = "$directory$git_branch$git_status$kubernetes$terraform$character";
      
      directory = {
        truncation_length = 3;
        fish_style_pwd_dir_length = 1;
      };

      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[➜](bold red)";
      };
    };
  };

    # --- ZSH ---
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    initContent = ''
      # Initialize Starship
      eval "$(starship init zsh)"
    '';

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