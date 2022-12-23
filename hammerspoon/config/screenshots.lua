-- Screenshots ----------------------------------------------------------------

local command = "screencapture"
local path = "$HOME/Downloads/screenshot-$(date +%Y-%m-%d-%H%M%S).png"

-- Capture full screen
H:bind({}, "5", function()
    hs.execute(command .. " " .. path)
    H.triggered = true
end)

-- Capture selection
-- -i    Capture screen interactively, by selection or window
H:bind({}, "6", function()
    hs.execute(command .. " -i " .. path)
    H.triggered = true
end)

-- Capture window
-- -i    Capture screen interactively, by selection or window
-- -W    Start interaction in window selection mode
-- -o    In window capture mode, do not capture the shadow of the window
H:bind({}, "7", function()
    hs.execute(command .. " -iWo " .. path)
    H.triggered = true
end)

-- Open Screenshots app
H:bind({}, "8", function()
    hs.application.open(Apps.screenshot)
    H.triggered = true
end)
