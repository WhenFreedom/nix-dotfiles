{pkgs, ...}:
{
		wayland.windowManager.sway = {
				enable = true;
				#systemd = true;
				xwayland = true;
				wrapperFeatures = {
						gtk = true;
					};
				config = {
					modifier = "Mod4";
					terminal = "kitty";
					/*left = "Left";
					right = "Right";
					up = "Up";
					down = "Down";
					menu = "wofi --show drun";*
					/*
					#monitors
					mon1 = "DP-2";
					mon2 = "HDMI-A-2";
					#workspace keys	
					k1 = 1;
					k2 = 2;
					k3 = 3;
					k4 = 5;
					k6 = 6;
					k7 = 7;
					k8 = 8;
					k9 = 9;*/

					/*terminal = "kitty";
					keybindings =
						{
							"${modifier}+Return" = "exec ${terminal}";
							"${modifier}+C" = "kill";
							"${modifier}+R" = "exec ${menu}";
							#window focus
							"${modifier}+${left}" = "focus left";
						};

					};*/
		};};
	}
