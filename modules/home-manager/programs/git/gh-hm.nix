{ pkgs, lib, config, ...}: {
    config = {
        programs.gh = {
          enable = true;
          settings = {
            editor = "nvim";
          };
          gitCredentialHelper.enable = true;
        };
    };
}
