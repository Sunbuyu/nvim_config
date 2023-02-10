-- leader key
vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

local map = vim.api.nvim_set_keymap
-- 复用 opt 参数
local opt = {noremap = true, silent = true }


-- 回车
map("i", "<A-CR>", "<C-[>o", opt)


-- 取消 s 默认功能
map("n", "s", "", opt)
-- windows 分屏快捷键
map("n", "sv", ":vsp<CR>", opt)
map("n", "sh", ":sp<CR>", opt)
-- 关闭当前
map("n", "sc", "<C-w>c", opt)
-- 关闭其他
map("n", "so", "<C-w>o", opt)
-- Alt + hjkl  窗口之间跳转
map("n", "<A-h>", "<C-w>h", opt)
map("n", "<A-j>", "<C-w>j", opt)
map("n", "<A-k>", "<C-w>k", opt)
map("n", "<A-l>", "<C-w>l", opt)


-- nvim-tree toggle
--map("n", "<C-q>", ":wq! <CR>", opt)
map("n", "<C-f>", ":NvimTreeToggle<CR>", opt)


-- Terminal相关
map("n", "<leader>t", ":vsp | terminal<CR>", opt)
map("n", "<leader>ht", ":sp | terminal<CR>", opt)
map("t", "<Esc>", "<C-\\><C-n>", opt)
map("t", "<A-h>", [[ <C-\><C-N><C-w>h ]], opt)
map("t", "<A-j>", [[ <C-\><C-N><C-w>j ]], opt)
map("t", "<A-k>", [[ <C-\><C-N><C-w>k ]], opt)
map("t", "<A-l>", [[ <C-\><C-N><C-w>l ]], opt)
map("t", "<S-n>", [[ <C-\><C-N> ]], opt)

-- 上下移动选中文本
map("v", "J", ":move '>+1<CR>gv-gv", opt)
map("v", "K", ":move '<-2<CR>gv-gv", opt)


--------------    插件的快捷键    -----------------------
-- local plugin_keys = {}
--
--

-- ----------- Telescope -----------
-- -- 查找文件
-- map("n", "<C-p>", ":Telescope find_files<CR>", opt)
-- -- 全局搜索
-- map("n", "<C-A-f>", ":Telescope live_grep<CR>", opt)
-- -- Telescope 列表中 插入模式快捷键
-- plugin_keys.telescopeList = {
--   i = {
--     -- 上下移动
--     ["<C-j>"] = "move_selection_next",
--     ["<C-k>"] = "move_selection_previous",
--     ["<Down>"] = "move_selection_next",
--     ["<Up>"] = "move_selection_previous",
--     -- 历史记录
--     ["<C-n>"] = "cycle_history_next",
--     ["<C-p>"] = "cycle_history_prev",
--     -- 关闭窗口
--     ["<C-c>"] = "close",
--     -- 预览窗口上下滚动
--     ["<C-u>"] = "preview_scrolling_up",
--     ["<C-d>"] = "preview_scrolling_down",
--   },
-- }


-- plugin_keys.cmp = function(cmp)
--     return {
--         -- 出现补全
--         ["<A-.>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
--         -- 取消
--         ["<A-,>"] = cmp.mapping({
--             i = cmp.mapping.abort(),
--             c = cmp.mapping.close()
--         }),
--         -- 上一个
--         ["<C-k>"] = cmp.mapping.select_prev_item(),
--         -- 下一个
--         ["<C-j>"] = cmp.mapping.select_next_item(),
--         -- 确认
--         ["<CR>"] = cmp.mapping.confirm({
--             select = true,
--             behavior = cmp.ConfirmBehavior.Replace
--         }),
--         -- 如果窗口内容太多，可以滚动
--         ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
--         ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"}),
--     }
-- end






-- return plugin_keys
