{pkgs, ...}: {
	programs.kitty = {
		enable = true;
		settings = {
				cursor_shape = "beam";
				background_opacity = "0.5";
				background_blur = "50";
			};
		};
}
