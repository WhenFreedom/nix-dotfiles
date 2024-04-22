{pkgs, ...}:
let 
  programS = import ./packages.nix;
in
{
  users.users.diverseuniverse = {
    isNormalUser = true;
    description = "diverseuniverse";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      #firefox
      vesktop
      kitty
      libnotify
      ytui-music
      qbittorrent
      gimp
      vscode
      tgpt
      beeper
      cava
      ncmpcpp
      vlc
      neofetch
      emacs
      nicotine-plus
      gparted
      polkit_gnome
      ];
    };
  }
