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
       # 1Password CLI Plugin Integration
      export OP_BIOMETRIC_UNLOCK_ENABLED=true
      if [ -f ~/.config/op/plugins.sh ]; then
        source ~/.config/op/plugins.sh
      fi

      if type op > /dev/null; then
        eval "$(op completion zsh)";
      fi

      # fzf-tab tweaks: preview directory content when completing cd
      zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza --tree --level=2 --color=always --icons $realpath'

      export TERM="xterm-256color"
    '';

    shellAliases = {
      ls = "eza --icons --git";
      ll = "eza -lh --icons --git";
      la = "eza -a --icons --git";
      cdi = "zi";
      ccat = "bat";
      du = "dust";
      ds = "dust -d 1";
      grep = "rg";
      k = "kubectl";
      find = "fd";
      nix-switch = "sudo darwin-rebuild switch --flake .#$(hostname -s)";
      nix-clean = "nix-collect-garbage -d";
      nix-conf = "code ~/nix-darwin-config";
      nix-update = "pushd . && nix flake update && nix-switch && popd";
      nix-upgrade = "git add . && nix flake update && sudo darwin-rebuild switch --flake .#$(hostname -s)";
      ops = "op signin";
    };
  };
}
