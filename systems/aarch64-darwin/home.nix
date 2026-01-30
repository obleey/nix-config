{ pkgs, ... }: {
  home.username = "obleey";
  home.homeDirectory = "/Users/obleey";
  
  imports = [
    ../../common/zsh
    ../../common/ghostty
    ../../common/vscode
    ../../common/starship # <--- Add this
    ../../common/fzf
    ../../common/zoxide
    ../../common/ssh
    ../../common/git
  ];

  home.stateVersion = "24.11";
}