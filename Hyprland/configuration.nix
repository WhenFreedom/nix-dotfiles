{pkgs, inputs, lib, ...}: {

  imports = [
    ../shared/config
    ./config
    ../comp/wayland/config
  ];

  networking.hostName = "hyprland";
  }
