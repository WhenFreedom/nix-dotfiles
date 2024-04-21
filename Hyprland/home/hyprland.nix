{ pkgs, ... }:
{
	wayland.windowManager.hyprland = {
		enable = true;
		xwayland.enable = true;

		settings = {
		"$mod" = "SUPER_L";
		"$m1" = "DP-2";
		"$m2" = "HDMI-A-2";
		monitor = [
		"$m1,2560x1440@144,0x0, 1"
		"$m2,1920x1080,2560x200, 1"
		];

		windowrulev2 = [
		"workspace name:Beeper silent, class:(Beeper)"
		];

		workspace = [
		"1, monitor:$m1"
		"2, monitor:$m1"
		"3, monitor:$m1"
		"4, monitor:$m1"
		"5, monitor:$m1"
		"6, monitor:$m1"
		"7, monitor:$m1"
		"8, monitor:$m1"
		"9, monitor:$m1"
		"10, monitor:$m2"
		"11, monitor:$m2"
		"12, monitor:$m2"
		"13, monitor:$m2"
		"14, monitor:$m2"
		"15, monitor:$m2"
		"16, monitor:$m2"
		"17, monitor:$m2"
		"18, monitor:$m2"
		];
		"$mf" = "movefocus";
		bind = [
		"$mod, left, $mf, l"
		"$mod, right, $mf, r"
		"$mod, up, $mf, u"
		"$mod, down, $mf, d"
		"$mod, Return, exec, kitty"
		"$mod, C, killactive"
		"$mod, Space, togglefloating"
		"$mod, R, exec, wofi --show drun"
		"$mod, F, fullscreen, 0"
		"$mod, d, workspace, name:Beeper"

#Workspace Rules
#workspace Monitor 1
		"$mod, $1, workspace, 1"
		"$mod, $2, workspace, 2"
		"$mod, $3, workspace, 3"
		"$mod, $4, workspace, 4"
		"$mod, $5, workspace, 5"
		"$mod, $6, workspace, 6"
		"$mod, $7, workspace, 7"
		"$mod, $8, workspace, 8"
		"$mod, $9, workspace, 9"

#workspace Monitor 2
		"$modAlt, $1, workspace, 10"
		"$modAlt, $2, workspace, 11"
		"$modAlt, $3, workspace, 12"
		"$modAlt, $4, workspace, 13"
		"$modAlt, $5, workspace, 14"
		"$modAlt, $6, workspace, 15"
		"$modAlt, $7, workspace, 16"
		"$modAlt, $8, workspace, 17"
		"$modAlt, $9, workspace, 18"

#Move to workspace Monitor 1
		"$modShift, $1, movetoworkspace, 1"
		"$modShift, $2, movetoworkspace, 2"
		"$modShift, $3, movetoworkspace, 3"
		"$modShift, $4, movetoworkspace, 4"
		"$modShift, $5, movetoworkspace, 5"
		"$modShift, $6, movetoworkspace, 6"
		"$modShift, $7, movetoworkspace, 7"
		"$modShift, $8, movetoworkspace, 8"
		"$modShift, $9, movetoworkspace, 9"

#Move to workspace Monitor 2
		"$mod-A-S, $1, movetoworkspace, 10"
		"$mod-A-S, $2, movetoworkspace, 11"
		"$mod-A-S, $3, movetoworkspace, 12"
		"$mod-A-S, $4, movetoworkspace, 13"
		"$mod-A-S, $5, movetoworkspace, 14"
		"$mod-A-S, $6, movetoworkspace, 15"
		"$mod-A-S, $7, movetoworkspace, 16"
		"$mod-A-S, $8, movetoworkspace, 17"
		"$mod-A-S, $9, movetoworkspace, 18"

		",XF86AudioNext, exec, mpc next"
		",XF86AudioPrev, exec, mpc prev"
		",XF86AudioStop, exec, mpc stop"
		",XF86AudioPlay, exec, mpc toggle"
		];

		binde = [
		",XF86AudioRaiseVolume, exec, pactl set-sink-volume 0 +3%"
		",XF86AudioLowerVolume, exec, pactl set-sink-volume 0 -3%"
		];

		bindm = [
		"$mod, mouse:272, movewindow"
		"$mod, mouse:273, resizewindow"
		];
		input = {
			kb_layout = "gb";
		};
		general = {
			layout = "dwindle";
			gaps_out = 5;
			gaps_in = 6;
		};
		decoration = {
			drop_shadow = true;
			shadow_range = 15;
		};
		misc = {
				disable_hyprland_logo = true;
			};
# Window Config
		"$modShift" = "$mod SHIFT";
		"$modAlt" = "$mod ALT_L";
		"$mod-A-S" = "$mod SHIFT ALT_L";

		"$0" = "KP_INSERT";
		"$1" = "KP_END";
		"$2" = "KP_DOWN";
		"$3" = "KP_NEXT";
		"$4" = "KP_LEFT";
		"$5" = "KP_BEGIN";
		"$6" = "KP_RIGHT";
		"$7" = "KP_HOME";
		"$8" = "KP_UP";
		"$9" = "KP_PRIOR";
		"$wallDir" = "/etc/nixos/Hyprland/home/wallpapers/";
		};
		extraConfig = ''
		exec-once = mpd-discord-rpc
		exec-once = swww init; swww img -o DP-2 $wallDir/Shadow.jpg; swww img -o HDMI-A-2 $wallDir/LetsEatGrandma.jpg
		'';
	};
}

