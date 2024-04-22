{pkgs, lib, ...}:
{
    imports = [
      ../shared/home
      ../comp/wayland/home
      ./home
      ./dotfiles.nix
    ];
  }
