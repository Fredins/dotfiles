vim.opt.number 	       = true
vim.opt.relativenumber = true
vim.opt.incsearch      = true
vim.opt.tabstop        = 2
vim.opt.softtabstop    = 2
vim.opt.shiftwidth     = 2
vim.opt.expandtab      = true
vim.opt.smartindent    = false
vim.opt.cindent        = false
vim.opt.autoindent     = false
vim.opt.hlsearch       = false
vim.opt.swapfile       = false
vim.opt.wrap           = false
vim.opt.backup         = false 
vim.opt.clipboard:append('unnamedplus')
vim.opt.scrolloff      = 10
vim.opt.completeopt    = 'menu,menuone,noselect'
vim.cmd('filetype indent off')
vim.cmd('filetype plugin off')
vim.cmd('syntax on')

vim.g.haskell_enable_quantification   = 1  -- to enable highlighting of `forall`
vim.g.haskell_enable_recursivedo      = 1  -- to enable highlighting of `mdo` and `rec`
vim.g.haskell_enable_arrowsyntax      = 1  -- to enable highlighting of `proc`
vim.g.haskell_enable_pattern_synonyms = 1  -- to enable highlighting of `pattern`
vim.g.haskell_enable_typeroles        = 1  -- to enable highlighting of type roles
vim.g.haskell_enable_static_pointers  = 1  -- to enable highlighting of `static`
vim.g.haskell_backpack                = 1  -- to enable highlighting of backpack keywords

