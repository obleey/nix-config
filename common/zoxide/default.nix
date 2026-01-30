{ ... }: {
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    # Optional: Add --cmd cd if you want zoxide to completely replace the 'cd' command
    options = [];
  };
}
