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
require("packer").startup(function(use)
  -- Менеджер плагинов
  use("wbthomason/packer.nvim")

  -- Тема Tokyo Night
  use({
    "folke/tokyonight.nvim",
    config = function()
      vim.cmd("colorscheme tokyonight-night")  -- Выбор стиля темы
    end
  })

  -- Строка состояния
  use({
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup({
        options = {
          theme = "tokyonight",
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff" },
          lualine_c = { 
            { 
              "filename", 
              path = 1,  -- Показывать полный путь к файлу
              symbols = { modified = "  ", readonly = "  " }
            }
          },
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" }
        }
      })
    end
  })

  -- Treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "html", "css", "javascript", "tsx", "vue" },
        highlight = { enable = true },
        indent = { enable = true }
      })
      vim.cmd("TSUpdate")
    end
  })

  -- Vue.js поддержка
  use("posva/vim-vue")

  if packer_bootstrap then
    require("packer").sync()
  end
end)

-- 4. Дополнительные настройки
vim.filetype.add({
  extension = {
    jsx = "javascriptreact",
    tsx = "typescriptreact"
  }
})
