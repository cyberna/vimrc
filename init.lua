-- ~/.config/nvim/init.lua

-- 1. Базовые настройки
vim.opt.number = true          -- Номера строк
vim.opt.relativenumber = false -- Абсолютные номера строк
vim.opt.tabstop = 2            -- Ширина табуляции
vim.opt.shiftwidth = 2         -- Размер отступа
vim.opt.expandtab = true       -- Пробелы вместо табов
vim.opt.autoindent = true      -- Автоотступы
vim.opt.termguicolors = true   -- Полноцветный режим
vim.opt.cursorline = true      -- Подсветка текущей строки
vim.opt.syntax = "ON"          -- Подсветка синтаксиса

-- 2. Установка Packer (менеджер плагинов)
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
      "git", "clone", "--depth", "1",
      "https://github.com/wbthomason/packer.nvim", install_path
    })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- 3. Настройка плагинов
require("packer").startup(function(use)
  -- Сам Packer
  use("wbthomason/packer.nvim")

  -- Тема Dracula
  use({
    "Mofiqul/dracula.nvim",
    config = function()
      vim.cmd("colorscheme dracula")
    end
  })

   -- Строка состояния
  use({
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "dracula",
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
        }
      })
    end
  })

  -- Улучшенная подсветка синтаксиса
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function() 
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "html", "css", "javascript", 
          "typescript", "tsx", "vue", "lua"
        },
        highlight = { enable = true },
        indent = { enable = true }
      })
    end
  })

  -- Дополнительные плагины
  use("posva/vim-vue")       -- Поддержка Vue.js
  use("neoclide/coc.nvim")   -- Автодополнение

  -- Автоматическая установка при первом запуске
  if packer_bootstrap then
    require("packer").sync()
  end
end)

-- 4. Пост-настройки
vim.filetype.add({
  extension = {
    jsx = "javascriptreact",
    tsx = "typescriptreact"
  }
})

-- 5. Настройки CoC
vim.g.coc_global_extensions = {
  'coc-html', 'coc-css', 'coc-tsserver',
  'coc-pyright', 'coc-json'
}

-- 6. Настройки Emmet
vim.g.user_emmet_leader_key = "<C-y>"

-- 7. Диагностика ошибок
vim.api.nvim_create_autocmd("User", {
  pattern = "PackerCompileDone",
  callback = function()
    print("✓ Конфиг успешно скомпилирован!")
  end
})
