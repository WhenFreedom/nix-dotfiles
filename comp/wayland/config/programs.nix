{pkgs, inputs, ...}:
let
	system = "x86_64-linux";
in
{
		users.users.diverseuniverse={
				packages = with pkgs; [
						wofi
						grim
						slurp
						wl-clipboard
						swww
						eww-wayland
						wf-recorder
						#swhkd
					];
			};
	}
