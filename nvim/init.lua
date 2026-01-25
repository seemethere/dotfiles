-- Eli's Neovim Configuration
-- Load core modules in order

require("core.options")   -- Must be first (sets leader before plugins)
require("core.lazy")      -- Bootstrap and load plugins
require("core.keymaps")   -- After plugins for overrides
require("core.autocmds")  -- Autocommands last
