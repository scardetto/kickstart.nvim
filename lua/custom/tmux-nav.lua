-- ===== Tmux + Neovim Seamless Navigation =====
local M = {}

function M.setup()
  local function smart_move(dir)
    local win = vim.fn.winnr()
    local edge = vim.fn.winnr(dir)
    if win == edge then
      local tmux_dir = ({ h = 'L', j = 'D', k = 'U', l = 'R' })[dir]
      vim.cmd('silent !tmux select-pane -' .. tmux_dir)
    else
      vim.cmd('wincmd ' .. dir)
    end
  end

  for _, mode in ipairs { 'n', 'v', 'o' } do
    vim.keymap.set(mode, '<C-h>', function()
      smart_move 'h'
    end, { noremap = true, silent = true })
    vim.keymap.set(mode, '<C-j>', function()
      smart_move 'j'
    end, { noremap = true, silent = true })
    vim.keymap.set(mode, '<C-k>', function()
      smart_move 'k'
    end, { noremap = true, silent = true })
    vim.keymap.set(mode, '<C-l>', function()
      smart_move 'l'
    end, { noremap = true, silent = true })
  end
end

return M
