local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
    vim.notify("没有找到 nvim-treesitter")
    return
end

-- vim.opt.foldmethod     = 'expr'
-- vim.opt.foldexpr       = 'nvim_treesitter#foldexpr()'
---WORKAROUND
-- vim.api.nvim_create_autocmd({'BufEnter','BufAdd','BufNew','BufNewFile','BufWinEnter'}, {
--   group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
--   callback = function()
--     vim.opt.foldmethod     = 'expr'
--     vim.opt.foldexpr       = 'nvim_treesitter#foldexpr()'
--   end
-- })


---ENDWORKAROUND
--

treesitter.setup({
  -- 安装 language parser
  -- :TSInstallInfo 命令查看支持的语言
  ensure_installed = {"cpp", "c", "cmake", "make", "python", "latex",
    "bash", "bibtex",
    "fortran", "json", "html","vim", "lua", "javascript", "typescript"},
  -- 启用代码高亮模块
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
})
