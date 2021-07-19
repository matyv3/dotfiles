
local M = {}

M.search_dotfiles = function()
    require("telescope.builtin").find_files({
        prompt_title = "< VimRC >",
        cwd = "/home/molivera/.config/nvim/",
    })
end

return M
