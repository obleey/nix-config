{ pkgs, user, hostname, ... }: {
  imports = [ ../../systems/aarch64-darwin/home-base.nix ];

  programs.git = {
    enable = true;
    # Newest syntax: extraConfig -> settings
    settings = {
      user = {
        name = "Miha Oblišar";
        email = "miha.oblishar@gmail.com";
      };
    };
  };

  programs.ssh = {
    enable = true;
    extraConfig = ''
      Host *
          IdentityAgent "~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
    '';
  };
}