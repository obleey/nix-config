{ pkgs, ... }: {
  home.stateVersion = "24.11"; 

  # Updated Git settings
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Miha Oblišar";
        email = "miha.oblishar@gmail.com";
      };
    };
  };

  # Updated VS Code settings (using the 'default' profile)
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
        beardedbear.beardedtheme # Lowercase fix
        beardedbear.beardedicons # Lowercase fix
        jnoortheen.nix-ide
      ];
      userSettings = {
        "workbench.colorTheme" = "Catppuccin Macchiato";
        "editor.fontSize" = 14;
        "editor.fontFamily" = "JetBrains Mono";
        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "nil"; # The standard Nix language server
      };
    };
  };
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      # The modern 'ls'
      ls = "eza --icons --git --group-directories-first";
      ll = "eza -lh --icons --git --group-directories-first";
      la = "eza -a --icons --git --group-directories-first";
      
      # Utilities
      cat = "bat";
      grep = "rg"; # If you decide to install ripgrep later
      
      # Nix-darwin shortcuts
      nix-switch = "sudo darwin-rebuild switch --flake ~/nix-darwin-config#obleey";
      nix-clean = "nix-collect-garbage -d";
      nix-conf = "code ~/nix-darwin-config"; # Opens your config in VS Code
    };
  };
}