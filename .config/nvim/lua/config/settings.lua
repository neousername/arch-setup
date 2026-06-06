vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.shiftwidth = 2
vim.opt.scrolloff = 100
vim.opt.clipboard = "unnamedplus"
vim.wo.relativenumber = true
vim.o.cmdheight = 0
vim.o.autoread = true

-- Custom Diagnostic Icons
local severity = vim.diagnostic.severity
vim.diagnostic.config({
  signs = {
    text = {
      [severity.ERROR] = "",
      [severity.WARN] = "",
      [severity.HINT] = "",
      [severity.INFO] = "",
    }
  }
})

-- LSP Setup
vim.lsp.enable({
  "lua_ls",
  "pylsp",
})

-- Global LSP Keybinds
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('my.lsp', {}),

  callback = function(ev)
    local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {
      buffer = ev.buf,
      desc = 'Go to definition',
    })

    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {
      buffer = ev.buf,
      desc = 'Go to declaration',
    })

    vim.keymap.set('n', 'K', vim.lsp.buf.hover, {
      buffer = ev.buf,
      desc = 'Hover documentation',
    })

    if client:supports_method('textDocument/implementation', ev.buf) then
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {
        buffer = ev.buf,
        desc = 'Go to implementation',
      })
    end

    if client:supports_method('textDocument/formatting', ev.buf) then
      vim.keymap.set('n', '<leader>lf', function()
        vim.lsp.buf.format({
          bufnr = ev.buf,
          id = client.id,
        })
      end, {
        buffer = ev.buf,
        desc = 'Format buffer',
      })
    end
  end,
})
