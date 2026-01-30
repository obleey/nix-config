{ pkgs }: [
  {
    name = "fzf-tab";
    src = pkgs.zsh-fzf-tab;
    file = "share/fzf-tab/fzf-tab.plugin.zsh";
  }
  # Add more plugins here in the future
]