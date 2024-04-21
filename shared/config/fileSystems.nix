{config, pkgs, ...}:
{
	fileSystems = {
		"/mnt/SecDrive" = { 
			device = "/dev/disk/by-label/SecondaryDrive" ;
			fsType = "ntfs3";
			options = [ "rw" "nofail" ];
		};
		"/mnt/Gaming" = {
			device = "/dev/disk/by-label/Gaming";
			fsType = "ntfs3";
			options = [ "rw" "nofail" ];
			};
		"/mnt/Windows" = {
				device = "/dev/disk/by-uuid/01DA5E2BC64D72A0";
				fsType = "ntfs3";
				options = [ "rw" "nofail" ];
			};
		"/mnt/Arch" = {
				device = "/dev/linux/ArchHome";
				fsType = "xfs";
				options = [ "rw" "nofail" ];
			};
	};
	}
