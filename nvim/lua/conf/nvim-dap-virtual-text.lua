local ok, dap_text = pcall(require, "nvim-dap-virtual-text")
if not ok then
    print("Warn: tried to load nvim-dap-virtual-text, but failed")
else
    dap_text.setup()
end
