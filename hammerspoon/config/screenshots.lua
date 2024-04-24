-- Screenshots ----------------------------------------------------------------

-- screencapture
--  -i    Capture screen interactively, by selection or window
--            control key - causes screenshot to go to clipboard
--            space key   - toggle between mouse selection and window selection modes
--            escape key  - cancels interactive screenshot
--  -W    Start interaction in window selection mode
--  -o    In window capture mode, do not capture the shadow of the window
--  -c    Force screen capture to go to the clipboard
local command = "screencapture"
local path = "$HOME/Downloads/screenshot-$(date +%Y-%m-%d-%H%M%S).png"

-- Open Screenshots app
H:bind({}, "5", function()
    hs.application.open(Apps.screenshot)
    H.triggered = true
end)

-- Capture selection
H:bind({}, "6", function()
    hs.execute(command .. " -i " .. path)
    H.triggered = true
end)

-- Capture window
H:bind({}, "7", function()
    hs.execute(command .. " -iW " .. path)
    H.triggered = true
end)

-- Capture full screen
H:bind({}, "8", function()
    hs.execute(command .. " " .. path)
    print(command .. " " .. path)
    H.triggered = true
end)
