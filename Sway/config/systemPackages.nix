{pkgs, inputs, ...}:
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
in
{
    environment.systemPackages = with pkgs; [
      glib
      dracula-theme
      dbus
      configure-gtk
      gnome3.adwaita-icon-theme
      dbus-sway-environment
      ungoogled-chromium
      xdg-utils
      wdisplays
      wlroots_0_16
      #inputs.swayfx.packages.${system}.swayfx-unwrapped
    ];

    services.pipewire = {
        enable = true;
        alsa.enable = true;
        pulse.enable = true;
      };
  }
