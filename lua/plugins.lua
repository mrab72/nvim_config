vim.cmd [[packadd packer.nvim]]
require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
   -- Packer
  use({
  "jackMort/ChatGPT.nvim",
    config = function()
      require("chatgpt").setup({
        -- optional configuration
        keymaps = {
      close = { "<C-c>" },
      submit = "<Enter>",
      yank_last = "<C-y>",
      yank_last_code = "<C-k>",
      scroll_up = "<C-u>",
      scroll_down = "<C-d>",
      toggle_settings = "<C-o>",
      new_session = "<C-n>",
      cycle_windows = "<Tab>",
      -- in the Sessions pane
      select_session = "<Space>",
      rename_session = "r",
      delete_session = "d",
  },
      })
    end,
    requires = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
  }) 
  use {'neoclide/coc.nvim', branch = 'release'}
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use 'preservim/nerdtree' 
  use 'hashivim/vim-terraform'
  use 'thehackercoding/onehalf-vim'
  use 'rust-lang/rust.vim'
  use 'sheerun/vim-polyglot' --- Syntax Highlighting + fixes a few issues with indent-blankline
  use 'dag/vim-fish'
  use 'ray-x/go.nvim'
  use 'ray-x/guihua.lua' -- recommended if need floating window support
  use 'nvim-treesitter/nvim-treesitter'
  use 'euclio/vim-markdown-composer'
  use { 'ibhagwan/fzf-lua',
  -- optional for icon support
  requires = { 'nvim-tree/nvim-web-devicons' }
  }
   use{"shaunsingh/nord.nvim"}
  use {
    "williamboman/nvim-lsp-installer",
    "neovim/nvim-lspconfig",
  }
end)
