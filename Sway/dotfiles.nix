{config, lib, pkgs, ...}:
	with lib;
	{
		xdg.configFile."sway".source = ./sway;
		}
