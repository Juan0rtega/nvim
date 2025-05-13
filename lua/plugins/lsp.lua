return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
	"folke/lazydev.nvim",
	ft = "lua", -- only load on lua files
	opts = {
	  library = {
	    -- See the configuration section for more details
	    -- Load luvit types when the `vim.uv` word is found
	  { path = "${3rd}/luv/library", words = { "vim%.uv" } },
	  },
	},
      }
    },
    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()
        local on_attach = function(client, bufnr) end
      require("lspconfig").pyright.setup{
	capabilities = capabilities,
	settings = {
	  python = {
	    analysis = {
	      typeCheckingMode = "basic",
	      reportAttributeAccessIssue = "none"
	      }
	  }
	}
      }
      require("lspconfig").lua_ls.setup{capabilities = capabilities}

      require("lspconfig").apex_ls.setup({
	capabilities = capabilities,
	cmd = {
	  "java",
	  "-jar",
	  "/home/juan-ortega/apex-lsp/apex-jorje-lsp.jar",
	  "apex language server",
	},
	apex_enable_semantic_errors = false,
	apex_enable_completion_statistics = false,
	filetypes = {
	  "apex",
	  "trigger",
	  "apexcode",
	},
	on_attach = on_attach
	})


    require("lspconfig").lwc_ls.setup({
      cmd = {
	"node",
	"/usr/local/bin/lwc-language-server",
	"--stdio",
      },
      filetypes = { "javascript", "html" },
      root_dir = require("lspconfig.util").root_pattern("sfdx-project.json", ".git"),
      init_options = {
	embeddedLanguages = {
	  javascript = true,
	},
      },
      capabilities = capabilities,
      on_attach = on_attach,
    })
    end,
  }
}
