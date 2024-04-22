{pkgs, inputs, lib, ...}:
let

dbus-sway-environment = pkgs.writeTextFile {
    name = "dbus-sway-environment";
    destination = "/bin/dbus-sway-environment";
    executable = true;

    text = ''
      dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=sway
      systemctl --user stop pipewire pipewire-media-session xdg-desktop-portal xdg-desktop-portal-wlr
      systemctl --user start pipewire pipewire-media-session xdg-desktop-portal xdg-desktop-portal-wlr
    '';
  };

  configure-gtk = pkgs.writeTextFile {
        name = "configure-gtk";
        destination = "/bin/configure-gtk";
        executable = true;
        text = let 
          schema = pkgs.gsettings-desktop-schemas;
          datadir = "${schema}/share/gsettings-schemas/${schema.name}";
          in ''
          gnome_schema=org.gnome.desktop.interface
          gsettings set $gnome_schema gtk-theme 'Dracula'
          '';
      };
    system = "x86_64-linux";
in
{
  imports = [
    ../shared/config
    ../comp/wayland/config
    ./config
    #./dotfiles.nix
    ];

    networking.hostName = "sway";

    security.polkit.enable = true;

    programs.sway = {
      enable = true;
      wrapperFeatures.gtk = true;
      package = pkgs.swayfx;
      };

      services.dbus.enable = true;
      xdg.portal = {
          enable = true;
          wlr.enable = true;
          extraPortals = [ 
          pkgs.xdg-desktop-portal-gtk
          pkgs.xdg-desktop-portal-wlr
          ];
        };

  }
