{ pkgs, lib, config, ...}: {
    config = {
        programs.git = {
            package = pkgs.gitAndTools.gitFull;
            enable = true;
            userName = "Tim Hämisch";
            userEmail = "github@thaemisch.com";
        };
    };
}
