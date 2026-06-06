return {
  'saghen/blink.cmp',
  dependencies = {
    'saghen/blink.lib',
    'rafamadriz/friendly-snippets',
  },
  opts = {
    keymap = { preset = 'default' },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
    fuzzy = {
      implementation = 'lua',
    },
  },
}
