-- https://github.com/nvim-neorg/neorg
local ok, neorg = pcall(require, "neorg")
if not ok then
  return
end

neorg.setup {
  load = {
    ["core.defaults"] = {}, -- Loads default behaviour
    ["core.itero"] = {}, -- Fast list/heading continuation
    ["core.integrations.treesitter"] = {}, --
    ["core.neorgcmd"] = {}, --
    ["core.mode"] = {}, --
    ["core.summary"] = {}, -- Loads summary
    ["core.journal"] = {}, --
    ["core.qol.toc"] = {}, --
    ["core.qol.todo_items"] = {}, --
    ["core.keybinds"] = {
      config = {
        default_keybinds = true,
        neorg_leader = " ",
      },
    }, -- Loads core.keybinds module, which provides keybinds for all the below modules
    ["core.concealer"] = {}, -- Adds pretty icons to your documents
    ["core.dirman"] = { -- Manages Neorg workspaces
      config = {
        workspaces = {
          work = "~/repos/neorg/work",
          personal = "~/repos/neorg/personal",
          school = "~/repos/neorg/school",
          projects = "~/repos/neorg/projects",
        },
        default_workspace = "projects",
      },
    },
  },
}
