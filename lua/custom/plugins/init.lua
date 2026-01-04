-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  { 'rebelot/kanagawa.nvim' },
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    config = function()
      require('neo-tree').setup {
        window = {
          number = true,
          relativenumber = true,
        },
        event_handlers = {
          {
            event = 'neo_tree_buffer_enter',
            handler = function()
              vim.opt_local.number = true
              vim.opt_local.relativenumber = true
            end,
          },
        },
      }
    end,
  },
  {
    'petertriho/nvim-scrollbar',
    dependencies = {
      'kevinhwang91/nvim-hlslens',
      'lewis6991/gitsigns.nvim',
    },
    config = function()
      require('scrollbar').setup {
        handlers = {
          diagnostic = true,
          gitsigns = true,
          search = true,
        },
      }
      -- enable integrations
      require('scrollbar.handlers.gitsigns').setup()
      require('scrollbar.handlers.search').setup()
    end,
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    ft = { 'markdown' },
    opts = {}, -- use defaults; configure later if needed
  },
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    opts = {
      label = { uppercase = false },
    },
    config = function(_, opts)
      local flash = require 'flash'
      flash.setup(opts)
      vim.keymap.set({ 'n', 'x', 'o' }, 's', flash.jump, { desc = 'Flash jump' })
    end,
  },
  -- Icon set used by many plugins
  { 'nvim-tree/nvim-web-devicons', lazy = true },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {},
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = {},
  },
  {
    'ap/vim-buftabline',
    event = 'VeryLazy',
  },
  -- {
  --   'scottmckendry/cyberdream.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require('cyberdream').setup {
  --       transparent = false,
  --     }
  --     vim.cmd.colorscheme 'cyberdream'
  --   end,
  -- },
  {
    dir = '/Users/jordanfields/AgentProjects/kiro.nvim/kiro.nvim',
    lazy = false,
    opts = {
      keymaps = { toggle = '<leader>kk' },
      ensure_greeting_disabled = true,
      default_view = 'left',
    },
  },
}
