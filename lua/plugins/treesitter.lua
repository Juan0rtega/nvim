return {
  {
    "nvim-treesitter/nvim-treesitter", 
    build = ":TSUpdate",
        config = function () 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = {"python", "apex", "lua", "vim", "vimdoc", "javascript", "html", "css" },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },  
        })
    end

  }
}
