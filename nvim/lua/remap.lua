--source: https://github.com/ThePrimeagen/init.lua/blob/master/lua/theprimeagen/remap.lua

-- THE LEADER
vim.g.mapleader = " "

-- FILE NAVIGATION
vim.keymap.set("n", "<leader>pv", "<cmd>Oil<CR>")
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- MOVE LINES UP AND DOWN
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- SLIGHTLY CHANGE DEFAULT BEHAVIOR
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- PASTE WIHTOUT CHANGING BUFFER
vim.keymap.set("x", "<leader>p", [["_dP]])

-- COPY TO CLIPBOARD
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- dont remember
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- CTRL-C = ESC
vim.keymap.set("i", "<C-c>", "<Esc>")

-- KILL Q
vim.keymap.set("n", "Q", "<nop>")

-- JUMP NEXT/PREVIOUS IN LIST
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- FIND AND REPLACE CURRENT WORD
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- MAKE CURRENT FILE INTO EXECUTABLE
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- ERRORHANDLING BOILERPLATE IN GOLANG
vim.keymap.set("n", "<leader>ee", "oif err != nil {<CR>}<Esc>Oreturn err<Esc>")
-- COMPILE TEMPL FILE
vim.keymap.set("n", "<leader>tt", "<cmd>!templ generate<CR>", { silent = true })

-- BACKSPACE EQUALS GO BACK TO ALTERNATE FILE
vim.keymap.set("n", "<BS>", "<C-^>")

-- NAVIGATE DIAGNOSTIC
vim.keymap.set("n", "<leader>sd", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>nd", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>pd", vim.diagnostic.goto_prev)

-- SOURCE CURRENT FILE
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

-- ALIGN ON EQUAL
vim.keymap.set({ "v", "x" }, "<leader>ae", "<cmd>:'<,'>! column -t -s '=' -o '='<CR>")

-- COPY AND PASTE CURRENT LINE
vim.keymap.set({ "n", "v" }, "<leader>jj", "Vyp")
vim.keymap.set({ "n", "v" }, "<leader>kk", "VyP")

-- OPEN TERMINAL WINDOW
vim.keymap.set("n", "<leader>tr", ":term<CR>i")
vim.keymap.set("n", "<leader>st", function()
    vim.cmd.vnew()
    vim.cmd.term()
    vim.cmd.wincmd("L")
    vim.api.nvim_win_set_width(0, 100)
end)
vim.keymap.set("t", "<C-x>", "<C-\\><C-n>")


vim.api.nvim_set_keymap('t', '<C-l><C-l>', [[<C-\><C-N>:lua ClearTerm(0)<CR>]], {})
vim.api.nvim_set_keymap('t', '<C-l><C-l><C-l>', [[<C-\><C-N>:lua ClearTerm(1)<CR>]], {})


function ClearTerm(reset)
  vim.opt_local.scrollback = 1

  vim.api.nvim_command("startinsert")
  if reset == 1 then
    vim.api.nvim_feedkeys("reset", 't', false)
  else
    vim.api.nvim_feedkeys("clear", 't', false)
  end
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<cr>', true, false, true), 't', true)

  vim.opt_local.scrollback = 10000
end
