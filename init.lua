-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.opt.number = true
vim.opt.relativenumber = false

-- =============================================
-- 1. 配置 OSC 52 剪贴板传输 (核心部分)
-- =============================================
-- 只有在远程 SSH 连接时才强制启用 OSC 52，本地运行不受影响
if os.getenv('SSH_TTY') then
  vim.g.clipboard = {
    name = 'OSC 52',
    copy = {
      ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
      ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
    },
    paste = {
      ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
      ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
    },
  }
end

-- =============================================
-- 2. 绑定 Ctrl+c 为复制 (关键部分)
-- =============================================

-- 在 Visual 模式 (v/V/Ctrl+v) 下选中内容后，按 Ctrl+c：
-- "+y  表示将选中内容 yank (复制) 到 + (系统) 寄存器
vim.keymap.set('v', '<C-c>', '"+y', { noremap = true, silent = true, desc = "Copy to system clipboard" })

-- 额外建议：为了符合 Windows 习惯，你可能也想把 Ctrl+v 设为粘贴
-- 在 Insert 模式下按 Ctrl+v 粘贴系统剪贴板内容
vim.keymap.set('i', '<C-v>', '<C-r>+', { noremap = true, silent = true, desc = "Paste from system clipboard" })

