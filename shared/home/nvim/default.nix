{pkgs, ...}:
{
	programs.neovim = {
		enable = true;
		extraPackages = with pkgs; [
		luajitPackages.lua-lsp
		];
		plugins = with pkgs.vimPlugins; [
		#Autoclose
		{
			plugin = autoclose-nvim;
			type = "lua";
			config = "${builtins.readFile ./autoclose.lua}";
		}
		#Catppuccin
		{
			plugin = catppuccin-nvim;
			type = "lua";
			config = "${builtins.readFile ./cmp.lua}";
		}

		#{
		#plugin = pkgs.vimUtils.buildVimPlugin {
		#						pname = "prettier.nvim";
		#						version = "2023-06-16";
		#						src = pkgs.fetchFromGitHub {
		#								owner = "MunifTanjim";
		#								repo = "prettier.nvim";
		#								rev = "5f97ff02334ca0e698014fe329c549709ac36c22";
		#								sha256 = "bthteL5YlriISfmwRupMlUQ94nYsaZ9nBbWEjJLOFkU=";
		#							};
		#					};
		#}
		#barbar-nvim
		{
				plugin = nvim-treesitter;
				type = "lua";
				config = "${builtins.readFile ./treesitter.lua}";
			}
		#{
		#		plugin = barbar-nvim;
		#		type = "lua";
		#		config = "${builtins.readFile nvim/barbar.lua}"
		#	}
		#Autocomplete
		nvim-lspconfig
		cmp-buffer
		cmp-nvim-lsp
		yuck-vim
		cmp-cmdline
		cmp_luasnip
		nvim-web-devicons
		{
			plugin = nvim-cmp;
			type = "lua";
			config = "${builtins.readFile ./catppuccin.lua}";
		}
		#Mason
		mason-lspconfig-nvim
		null-ls-nvim
		nvim-lspconfig
		lspkind-nvim
		{
			plugin = mason-nvim;
			type = "lua";
			config = "${builtins.readFile ./mason.lua}";
		}
		#Explorer
		{
			plugin = nvim-tree-lua;
			type = "lua";
			config = ''require("nvim-tree").setup{}'';
		}
		];
		extraLuaConfig = "${builtins.readFile ./settings.lua}";
	};
}
