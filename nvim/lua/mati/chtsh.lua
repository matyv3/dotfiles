
--local cURL = require("cURL")
local api = vim.api
local buf, win
local languages = { 'golang', 'typescript', 'php' }
-- TODO al pedo seleccionar lenguaje mejor que tome el que se esta usando

local M = {}

M.language = nil

local function get_menu_items()
end

local function close_window()
	api.nvim_win_close(win, true)
end

M.select_menu_item = function()
  local str = api.nvim_get_current_line()
  M.language = str
  close_window()
end

local function make_curl()
	--headers = {
		--"Accept: text/*",
	--}

	--curl.easy{
		--url = 'https://cht.sh/golang/slice',
		--writefunction = io.stderr -- use io.stderr:write()
	--}
	--:perform()
	--:close()
end

local function set_mappings()
  local mappings = {
    q = 'close()',
    ['<cr>'] = 'select_menu_item()',
    v = 'split("v")',
    s = 'split("")',
    p = 'preview()',
    t = 'open_in_tab()'
  }

  for k,v in pairs(mappings) do
    -- let's assume that our script is in lua/nvim-oldfile.lua file.
    api.nvim_buf_set_keymap(buf, 'n', k, ':lua require"mati.chtsh".'..v..'<cr>', {
        nowait = true, noremap = true, silent = true
      })
  end
end

M.search_sh = function()
	buf = api.nvim_create_buf(false, true) -- create new emtpy buffer

	api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')

	-- get dimensions
	local width = api.nvim_get_option("columns")
	local height = api.nvim_get_option("lines")

	-- calculate our floating window size
	local win_height = math.ceil(height * 0.4 - 4)
	local win_width = math.ceil(width * 0.4)

	-- and its starting position
	local row = math.ceil((height - win_height) / 2 - 1)
	local col = math.ceil((width - win_width) / 2)

	-- set some options
	local opts = {
		style = "minimal",
		relative = "editor",
		width = win_width,
		height = win_height,
		row = row,
		col = col
	}

	-- and finally create it with buffer attached
	win = api.nvim_open_win(buf, true, opts)

	api.nvim_buf_set_lines(buf, 0, -1, false, languages)

	set_mappings()
end

return M

