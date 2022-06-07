-- load files from basic folder
local ok, _ = pcall(require, "basic.settings")
if not ok then
    print("Warn: tried to load basic.settings, but failed")
end

local ok, _ = pcall(require, "basic.keybinds")
if not ok then
    print("Warn: tried to load basic.keybinds, but failed")
end

local ok, _ = pcall(require, "basic.config")
if not ok then
    print("Warn: tried to load basic.config, but failed")
end

local ok, _ = pcall(require, "basic.plugins")
if not ok then
    print("Warn: tried to load basic.plugins, but failed")
end

local ok, _ = pcall(require, "basic.options")
if not ok then
    print("Warn: tried to load basic.options, but failed")
end


vim.cmd("hi illuminatedWord cterm=underline gui=underline guibg=#737373")
-- vim.cmd("hi link AerialClass Type")
-- vim.cmd("hi link AerialClassIcon Special")
-- vim.cmd("hi link AerialFunction Special")
-- vim.cmd("hi AerialFunctionIcon guifg=#cb4b16 guibg=#121212 guisp=NONE gui=NONE cterm=NONE")

-- -- " There's also this group for the cursor position
-- vim.cmd("hi link AerialLine QuickFixLine")
-- -- " If highlight_mode="split_width", you can set a separate color for the
-- -- " non-current location highlight
-- vim.cmd("hi AerialLineNC guibg=Gray")

-- -- " You can customize the guides (if show_guide=true)
-- vim.cmd("hi link AerialGuide Comment")
-- -- " You can set a different guide color for each level
-- vim.cmd("hi AerialGuide1 guifg=Red")
-- vim.cmd("hi AerialGuide2 guifg=Blue")
