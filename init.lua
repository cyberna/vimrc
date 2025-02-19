-- ~/.config/nvim/init.lua

-- 1. Базовые настройки Neovim
vim.opt.number = true          -- Номера строк
vim.opt.syntax = "ON"          -- Подсветка синтаксиса
vim.opt.tabstop = 2            -- Ширина табуляции (пробелов)
vim.opt.shiftwidth = 2         -- Ширина сдвига (>> и <<)
vim.opt.expandtab = true        -- Использовать пробелы вместо табов
vim.opt.autoindent = true       -- Автоматические отступы
vim.opt.termguicolors = true    -- Полноцветный режим
vim.opt.cursorline = true       -- Подсветка текущей строки

-- 2. Установка менеджера плагинов Packer
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

-- 3. Настройка плагинов через Packer
return require("packer").startup(function(use)
  -- Сам Packer (обязательно)
  use("wbthomason/packer.nvim")

  -- Тема Tokyo Night
  use({
    "folke/tokyonight.nvim",
    config = function()
      vim.cmd("colorscheme tokyonight") -- Установка темы
    end
  })

  -- Автоматическая синхронизация при первом запуске
  if packer_bootstrap then
    require("packer").sync()
  end
end)
