-- A global variable for Hyper Mode
local M = hs.hotkey.modal.new({}, nil)

-- Enter Hyper Mode when F20 (Hyper/Capslock) is pressed
local function enter_hyper_mode()
    M.triggered = false
    M:enter()
end

-- Leave Hyper Mode when F20 (Hyper/Capslock) is pressed
local function exit_hyper_mode()
    M:exit()
end

-- Bind the Hyper key
hs.hotkey.bind({}, "F20", enter_hyper_mode, exit_hyper_mode)

return M
