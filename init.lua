-- ~/.config/nvim/init.lua

-- 1. Базовые настройки
vim.opt.number = true
vim.opt.syntax = "ON"
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.termguicolors = true
vim.opt.cursorline = true

-- 2. Установка Packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- 3. Настройка плагинов
return require("packer").startup(function(use)
  use("wbthomason/packer.nvim")

  -- Тема Tokyo Night
  use({
    "folke/tokyonight.nvim",
    config = function()
      vim.cmd("colorscheme tokyonight")
    end
  })

  -- Treesitter (улучшенная подсветка)
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "html",
          "css",
          "javascript",
          "typescript",
          "tsx",        -- React.js
          "vue"         -- Vue.js
        },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },    -- Автоотступы
      })
    end
  })

  -- Дополнительно для Vue.js
  use("posva/vim-vue")  -- Лучшая подсветка .vue файлов

  if packer_bootstrap then
    require("packer").sync()
  end
end)

-- 4. Дополнительные настройки для React/JSX
vim.filetype.add({
  extension = {
    jsx = "javascriptreact",
    tsx = "typescriptreact"
  }
})
