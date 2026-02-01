{ ... }:
{
  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    icons = "auto";
    git = true;
    # These become the default for EVERY time you run eza/ls/ll
    extraOptions = [
      "--group-directories-first"
      "--header"
    ];
  };
}
