{pkgs, ...}:
{
		xdg = {
				autostart.enable = true;
				portal = {
						enable = true;
						extraPortals = with pkgs; [
							xdg-desktop-portal
							xdg-desktop-portal-gtk
						];
					};
			};
	}
