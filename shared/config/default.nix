{ pkgs, inputs, lib, ... }:

{
		imports = [
			./hardware-configuration.nix
			./locale.nix
			./sound.nix
			./fonts.nix
			./user.nix
			./systemPackages.nix
			./fileSystems.nix
			#./Firefox
		];
	#Enable Networking
	networking.networkmanager.enable = true;

	# Enable CUPS to print documents.
  services.printing.enable = true;

	#Enable Flakes
	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	#Default Shell Zsh
	users.defaultUserShell = pkgs.zsh;

	# Allow unfree packages
  nixpkgs.config.allowUnfree = true;

	boot = {
			loader = {
					systemd-boot.enable = true;
					efi.canTouchEfiVariables = true;
				};
			supportedFilesystems = [ "ntfs" ];
		};


	#System State Version
	system.stateVersion = "23.11";
}
