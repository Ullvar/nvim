vim.g.mapleader = " "

vim.keymap.set('n', '<Esc>', '<cmd>:noh<cr>', {})

vim.keymap.set('n', '<Tab>', '<cmd>:BufferLineCycleNext<cr>', {})
vim.keymap.set('n', '<BS>', '<cmd>:BufferLineCyclePrev<cr>', {})
vim.keymap.set('n', '<leader>w', '<cmd>:bdelete!<cr>', {})
vim.keymap.set('n', '<leader>bl', '<cmd>:BufferLinePick<cr>', {})

vim.api.nvim_set_keymap('n', 'zc', 'zf%', { noremap = true })
vim.api.nvim_set_keymap('v', '<leader>y', '"+y', { noremap = true })
vim.api.nvim_set_keymap('v', '<leader>d', '"+d', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>p', '"+p', { noremap = true })

vim.api.nvim_set_keymap('n', '<C-k>', ':wincmd k<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', ':wincmd j<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-h>', ':wincmd h<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', ':wincmd l<CR>', { silent = true })

vim.api.nvim_set_keymap('n', '<leader>b', '<C-W><C-W>', {noremap = true})

local telescope_builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescope_builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', telescope_builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', telescope_builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', telescope_builtin.help_tags, {})

vim.keymap.set('i', '<M-1>', '<Plug>(copilot-next)')
vim.keymap.set('i', '<M-2>', '<Plug>(copilot-previous)')
vim.keymap.set("i", "<M-3>", 'copilot#Accept("")', {noremap = true, silent = true, expr = true, replace_keycodes = false })

vim.keymap.set('n', '<leader>[', '<cmd>lua Open_File_In_Github()<cr>', opts)

vim.keymap.set('n', '<leader>tt', '<cmd>:NvimTreeToggle<cr>', {})
vim.keymap.set('n', '<leader>tf', '<cmd>:NvimTreeFindFile<cr>', {})

vim.keymap.set('n', '<leader>tb', '<cmd>Gitsigns toggle_current_line_blame<CR>', opts)

function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

function _G.show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end

vim.keymap.set("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', {silent = true, noremap = true, expr = true, replace_keycodes = false})
vim.keymap.set("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], {silent = true, noremap = true, expr = true, replace_keycodes = false})
vim.keymap.set("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], {silent = true, noremap = true, expr = true, replace_keycodes = false})
vim.keymap.set("n", "[g", "<Plug>(coc-diagnostic-prev)", {silent = true})
vim.keymap.set("n", "]g", "<Plug>(coc-diagnostic-next)", {silent = true})
vim.keymap.set("n", "gd", "<Plug>(coc-definition)", {silent = true})
vim.keymap.set("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
vim.keymap.set("n", "gi", "<Plug>(coc-implementation)", {silent = true})
vim.keymap.set("n", "gr", "<Plug>(coc-references)", {silent = true})
vim.keymap.set("n", "<leader>rn", "<Plug>(coc-rename)", {silent = true})
vim.keymap.set("n", "K", '<CMD>lua _G.show_docs()<CR>', {silent = true})
vim.keymap.set("n", "<leader>ac", "<Plug>(coc-codeaction)", {silent = true, nowait = true})

vim.api.nvim_create_user_command("Format", "call CocAction('format')", {})
vim.api.nvim_create_user_command("Fold", "call CocAction('fold', <f-args>)", {nargs = '?'})
vim.api.nvim_create_user_command("OR", "call CocActionAsync('runCommand', 'editor.action.organizeImport')", {})
vim.api.nvim_create_user_command("RN", "call CocActionAsync('runCommand', 'workspace.renameCurrentFile')", {})

vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end)
vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end)
vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end)
vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end)
vim.keymap.set("n", "gR", function() require("trouble").toggle("lsp_references") end)
