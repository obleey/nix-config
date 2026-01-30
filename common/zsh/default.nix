{ pkgs, ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    # Logic: Pull plugins from our sidecar file
    plugins = import ./plugins.nix { inherit pkgs; };

    initExtra = ''
      # Initialize Starship
      eval "$(starship init zsh)"

      # 1Password CLI Plugin Integration
      export OP_BIOMETRIC_UNLOCK_ENABLED=true
      if [ -f ~/.config/op/plugins.sh ]; then
        source ~/.config/op/plugins.sh
      fi
      
      # fzf-tab tweaks: preview directory content when completing cd
      zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
    '';

    shellAliases = {
      ls = "eza --icons --git --group-directories-first";
      ll = "eza -lh --icons --git --group-directories-first";
      la = "eza -a --icons --git --group-directories-first";
      cat = "bat";
      grep = "rg";
      k = "kubectl";
      nix-switch = "sudo darwin-rebuild switch --flake ~/nix-darwin-config#obleey";
      nix-clean = "nix-collect-garbage -d";
      nix-conf = "code ~/nix-darwin-config";
      nix-update = "pushd ~/nix-darwin-config && nix flake update && nix-switch && popd";
    };
  };
}