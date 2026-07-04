return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		config = function()
			vim.filetype.add({
				extension = { nbcl = "nbcl" },
			})

			vim.api.nvim_create_autocmd("User", {
				pattern = "TSUpdate",
				callback = function()
					require("nvim-treesitter.parsers").nbcl = {
						install_info = {
							url = "https://github.com/NBCL-Lang/tree-sitter-nbcl",
							files = { "src/parser.c" },
							branch = "main",
							revision = "71531c064649df7d51d055de527789f8dc51695a",
							queries = "queries",
						},
						tier = 0,
					}
				end,
			})

			vim.api.nvim_create_autocmd("FileType", {
				pattern = "nbcl",
				callback = function()
					pcall(vim.treesitter.start)
				end,
			})
		end,
	},
}
