local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

local plugins = {
	-- lua functions that many plugins
	"nvim-lua/plenary.nvim",

	-- colorschemes
	-- "ellisonleao/gruvbox.nvim",
	-- "lunarvim/darkplus.nvim",
	-- "navarasu/onedark.nvim",
	-- { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	-- "EdenEast/nightfox.nvim",
	"Mofiqul/dracula.nvim",

	-- comment gcc
	"numToStr/Comment.nvim",

	-- neovim tree file explore
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"stevearc/oil.nvim", --optional (file explore)
			"nvim-tree/nvim-web-devicons", -- icons for nvim tree
		},
	},

	-- status bar
	"nvim-lualine/lualine.nvim",

	-- fuzzy finding w/ telescope
	{ "nvim-telescope/telescope.nvim", branch = "0.1.x" }, -- fuzzy finder
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- dependency for better sorting performance
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
	},
	-- autocompletion
	{
		"hrsh7th/nvim-cmp", -- completion plugin
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-buffer", -- source for text in buffer
			"hrsh7th/cmp-path", -- source for file system paths
			"L3MON4D3/LuaSnip", -- snippet engine
			"saadparwaiz1/cmp_luasnip", -- for autocompletion
			"rafamadriz/friendly-snippets", -- useful snippets
		},
	},

	-- managing & installing lsp servers, linters & formatters
	{
		"williamboman/mason.nvim", -- in charge of managing lsp servers, linters & formatters
		dependencies = {
			"williamboman/mason-lspconfig.nvim", -- bridges gap b/w mason & lspconfig
		},
	},

	-- configuring lsp servers
	{
		"neovim/nvim-lspconfig", -- easily configure language servers
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp", -- for autocompletion
		},
	},

	--- enhanced lsp uis
	"onsails/lspkind.nvim", -- vs-code like icons for autocompletion

	-- vim ui interface
	{
		"stevearc/dressing.nvim",
		opts = {},
	},

	-- formating and linting
	"jose-elias-alvarez/null-ls.nvim",
	"jayp0521/mason-null-ls.nvim",

	-- treesitter configuration
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		-- requires = {
		-- { "ikatyang/tree-sitter-markdown" },
		{ "markedjs/marked" }, -- markdown
		{ "markdown-it/markdown-it" }, -- markdown parser
	},
	-- TSIntall cpp, for c++ syntax highlighting

	-- auto closing
	"windwp/nvim-autopairs", -- autoclose parens, brackets, quotes, etc...

	-- autoclose tags
	{ "windwp/nvim-ts-autotag", dependencies = { "nvim-treesitter" } },

	-- doc string generator
	{
		"danymat/neogen",
		dependencies = "nvim-treesitter/nvim-treesitter",
		config = true,
	},

	-- toggle terminal
	"akinsho/toggleterm.nvim",

	-- moving around vim
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {},
		-- stylua: ignore
		keys = {
			{ "s", mode = { "n", "o", "x" }, function() require("flash").jump() end, desc = "Flash" },
			{
				"S",
				mode = { "n", "o", "x" },
				function() require("flash").treesitter() end,
				desc =
				"Flash Treesitter"
			},
			{
				"r",
				mode = "o",
				function() require("flash").remote() end,
				desc =
				"Remote Flash"
			},
			{
				"R",
				mode = { "o", "x" },
				function() require("flash").treesitter_search() end,
				desc =
				"Treesitter Search"
			},
			{
				"<c-s>",
				mode = { "c" },
				function() require("flash").toggle() end,
				desc =
				"Toggle Flash Search"
			},
		},
	},

	-- gitsigns
	"lewis6991/gitsigns.nvim",

	-- add/delete/change surroundings
	"tpope/vim-surround",

	-- tmux & split window navigation
	"christoomey/vim-tmux-navigator",

	-- interacting with GPT models from OpenAI
	"Bryley/neoai.nvim",
	"MunifTanjim/nui.nvim", -- nui dependency

	-- github copilot
	"github/copilot.vim",

	-- vim indent guiides
	"lukas-reineke/indent-blankline.nvim",

	-- neorg (org-mode for neovim)
	{
		"nvim-neorg/neorg",
		build = ":Neorg sync-parsers",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	-- markdown preview
	"iamcco/markdown-preview.nvim",

	-- debugging
	{
		"rcarriga/nvim-dap-ui",
		event = "VeryLazy",
		dependencies = {
			"theHamsta/nvim-dap-virtual-text",
			"nvim-telescope/telescope-dap.nvim",
			"mfussenegger/nvim-dap",
		},
		-- { "mfussenegger/nvim-dap-python" },
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		event = "VeryLazy",
		dependencies = { "williamboman/mason.nvim", "mfussenegger/nvim-dap" },
	},

	{
		"mfussenegger/nvim-dap",
	},

	-- cmake tools
	{
		"Civitasv/cmake-tools.nvim",
		-- "cdelledonne/vim-cmake",
	},
	-- tests/neotest
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
			-- "alfaix/neotest-gtest",
			"nvim-neotest/neotest-python",
		},
	},

	--tests/vim-gtest
	{
		"alepez/vim-gtest",
	},
}
local opts = {}
require("lazy").setup(plugins, opts)
