{ pkgs, ... }:

{
  programs.git = {
    enable = true;

    userName = "Martí Llinàs";
    userEmail = "marti.llinas.comas@gmail.com";

    aliases = {
      s = "status";
      c = "commit";
      co = "checkout";
    };

    extraConfig = {
      credential = {
        helper = "cache";
      };
    };
  };
}
