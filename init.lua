require("config.lazy")
local set = vim.opt

set.shiftwidth = 4
set.number = true
set.relativenumber = true
set.clipboard = "unnamedplus"

vim.filetype.add({
  extension = {
    cls = "apex",
    trigger = "apex",
  },
})
