{
	nixConfig = {
		substituters = [
		"https://hyprland.cachix.org"
		"https://nix-community.cachix.org"
		"https://cache.nixos.org"
		];
		trusted-public-keys = [
		"hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
		"nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
		"cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
		];
		};

		description = "A simple NixOS flake";
		
		inputs = {
			#nixos package source.
			nixpkgs-wayland.url = "github:nix-community/nixpkgs-wayland";
			nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
			hyprland.url = "github:hyprwm/Hyprland";
			home-manager = {
					url = "github:nix-community/home-manager";
					inputs.nixpkgs.follows = "nixpkgs";
				};
				swayfx.url = "github:WillPower3309/swayfx";
				swhkd = {
						url = "github:waycrate/swhkd";
						inputs.nixpkgs.follows = "nixpkgs";
					};
			#eww-mpd.url = "git+ssh://git@github.com/celestialseaz/eww-mpd";

			};

			outputs = { self, nixpkgs, home-manager, hyprland, swayfx, swhkd, ... }
			@inputs:
			{
				nixosConfigurations = {
						hyprland = nixpkgs.lib.nixosSystem {
							system = "x86_64-linux";
							specialArgs = { inherit inputs; };
							modules = [
								./Hyprland/configuration.nix
								hyprland.nixosModules.default
								{programs.hyprland.enable = true;}
								home-manager.nixosModules.home-manager 
								{
									home-manager.useGlobalPkgs = true;
									home-manager.useUserPackages = true;
									home-manager.users.diverseuniverse = import ./Hyprland/home.nix;
								}
								#{
								#	nix.settings.trusted-users = ["diverseuniverse"];
								#}
							];
						};
						sway = nixpkgs.lib.nixosSystem {
							system = "x86_64-linux";
							specialArgs = { inherit inputs; };
							#devEnv = swhkd.devShells.system;
							

							modules = [
								./Sway/configuration.nix
								home-manager.nixosModules.home-manager
								{
										home-manager.useGlobalPkgs = true;
										home-manager.useUserPackages = true;
										home-manager.users.diverseuniverse = import ./Sway/home.nix;
									}
							];
						};
					};

			};
}
