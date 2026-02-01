{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    # Logic: Pull plugins from our sidecar file
    plugins = import ./plugins.nix { inherit pkgs; };

    initContent = ''
      # Initialize Starship
      eval "$(starship init zsh)"

      # 1Password CLI Plugin Integration
      export OP_BIOMETRIC_UNLOCK_ENABLED=true
      if [ -f ~/.config/op/plugins.sh ]; then
        source ~/.config/op/plugins.sh
      fi

      if type op > /dev/null; then
        eval "$(op completion zsh)";
      fi

      # fzf-tab tweaks: preview directory content when completing cd
      zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
    '';

    shellAliases = {
      ls = "eza --icons --git --group-directories-first";
      ll = "eza -lh --icons --git --group-directories-first";
      la = "eza -a --icons --git --group-directories-first";
      cd = "z";
      cdi = "zi";
      ccat = "bat";
      grep = "rg";
      k = "kubectl";
      find = "fd";
      nix-switch = "sudo darwin-rebuild switch --flake .#$(hostname -s)";
      nix-clean = "nix-collect-garbage -d";
      nix-conf = "code ~/nix-darwin-config";
      nix-update = "pushd . && nix flake update && nix-switch && popd";
      nix-upgrade = "git add . && nix flake update && sudo darwin-rebuild switch --flake .";
      ops = "op signin";
    };
  };
}
