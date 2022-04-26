-- https://github.com/nvim-lualine/lualine.nvim
-- https://github.com/SmiteshP/nvim-gps

local ok, gps = pcall(require, "nvim-gps")
if not ok then
    print("Warn: tried to load nvim-gps, but failed")
end

local filetype_table = {
    "NvimTree",
    "aerial"
}

local function disable_built_component()
    local filetype = vim.bo.filetype
    for _, ft in ipairs(filetype_table) do
        if filetype == ft then
            return false
        end
    end
    return true
end

local function enable_built_component()
    local filetype = vim.bo.filetype
    for _, ft in ipairs(filetype_table) do
        if filetype == ft then
            return true
        end
    end
    return false
end

gps.setup()

local ok, lualine = pcall(require, "lualine")
if not ok then
    print("Warn: tried to load lualine, but failed")
else
    lualine.setup(
        {
            options = {
                icons_enabled = true,
                theme = "everforest",
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
                disabled_filetypes = {},
                always_divide_middle = true
            },
            sections = {
                lualine_a = {
                    { "mode", cond = disable_built_component },
                    -- {"tabs", cond = disable_built_component},
                    -- {"buffers", cond = disable_built_component}
                },
                lualine_b = {
                    { "branch", cond = disable_built_component },
                    { "diff", cond = disable_built_component },
                    { "diagnostics", cond = disable_built_component }
                },
                lualine_c = {
                    { "filename", cond = disable_built_component },
                    { gps.get_location, cond = gps.is_available }
                },
                lualine_x = {
                    { "encoding", cond = disable_built_component },
                    { "hostname", cond = disable_built_component },
                    { "fileformat", cond = disable_built_component },
                    { "filetype", cond = disable_built_component }
                },
                lualine_y = {
                    { "progress", cond = disable_built_component }
                },
                lualine_z = {
                    -- {"location", cond = disable_built_component},
                    { '%l/%L:%c', cond = disable_built_component }
                }
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { "filename" },
                lualine_x = {
                    { '%l/%L:%c', cond = disable_built_component },
                },
                lualine_y = {},
                lualine_z = {}
            },
            tabline = {}
        }
    )
end
