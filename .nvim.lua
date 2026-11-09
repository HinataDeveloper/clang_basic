-- .nvim.lua: project-local Neovim config for a C project
-- Requires: Neovim 0.11+, clangd (sudo dnf install clang-tools-extra)
-- Neovim asks you to trust this file the first time (":trust" or the prompt).

-- ---------- Editor settings (Linux kernel style) ----------
vim.opt_local.expandtab = false
vim.opt.tabstop = 8
vim.opt.shiftwidth = 8
vim.opt.softtabstop = 8
vim.opt.cindent = true
vim.opt.colorcolumn = "80"
vim.opt.makeprg = "make"

-- ---------- LSP: clangd for C ----------
vim.lsp.config("clangd", {
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--header-insertion=never",
    "--completion-style=detailed",
  },
  filetypes = { "c" },
  root_markers = { "compile_commands.json", ".clangd", ".git" },
})
vim.lsp.enable("clangd")

-- ---------- Diagnostics ----------
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

-- ---------- Keymaps when LSP attaches ----------
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("ProjectLsp", { clear = true }),
  callback = function(ev)
    local map = function(keys, fn, desc)
      vim.keymap.set("n", keys, fn, { buffer = ev.buf, desc = desc })
    end
    map("gd", vim.lsp.buf.definition, "Go to definition")
    map("gD", vim.lsp.buf.declaration, "Go to declaration")
    map("K", vim.lsp.buf.hover, "Hover docs")
    map("<leader>rn", vim.lsp.buf.rename, "Rename symbol")
    map("<leader>ca", vim.lsp.buf.code_action, "Code action")
    map("<leader>f", function() vim.lsp.buf.format({ async = true }) end, "Format")
    map("[d", function() vim.diagnostic.jump({ count = -1 }) end, "Previous diagnostic")
    map("]d", function() vim.diagnostic.jump({ count = 1 }) end, "Next diagnostic")
    map("<leader>e", vim.diagnostic.open_float, "Show diagnostic")
    -- Switch between .c and .h
    map("<leader>h", "<cmd>LspClangdSwitchSourceHeader<cr>", "Switch source/header")
  end,
})

-- Built-in Treesitter highlighting for C
vim.api.nvim_create_autocmd("FileType", {
  pattern = "c",
  callback = function() pcall(vim.treesitter.start) end,
})
