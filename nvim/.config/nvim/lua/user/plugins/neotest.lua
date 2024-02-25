local ok, neotest = pcall(require, "neotest")
if not ok then
	return
end

-- local fine, neotest_gtest = pcall(require, "neotest-gtest")
-- if not fine then
-- 	return
-- end
--
-- neotest_gtest.setup({})

neotest.setup({
	adapters = {
		-- cpp
		-- require("neotest-gtest")({
		-- 	dap = {
		-- 		justMyCode = false,
		-- 		concole = "intergratedTerminal",
		-- 	},
		-- }),
		-- python
		require("neotest-python")({
			dap = {
				justMyCode = false,
				concole = "intergratedTerminal",
			},
			args = { "--log-level", "DEBUG", "--quiet" },
			runner = "pytest",
		}),
	},
})
