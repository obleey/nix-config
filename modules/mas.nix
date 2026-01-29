{ pkgs, ... }: {
  environment.systemPackages = [ pkgs.mas ];

  homebrew = {
    enable = true;
    masApps = {
      "Magnet" = 441258766;
    };
  };
}