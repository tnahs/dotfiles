-- Screenshots ----------------------------------------------------------------

-- screencapture
--  -i    Capture screen interactively, by selection or window
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

-- Capture window to clipboard
H:bind({}, "6", function()
    hs.execute(command .. " -iWc " .. path)
    H.triggered = true
end)

-- Capture window
H:bind({ "option" }, "6", function()
    hs.execute(command .. " -iW " .. path)
    H.triggered = true
end)

-- Capture selection to clipboard
H:bind({}, "7", function()
    hs.execute(command .. " -ic " .. path)
    H.triggered = true
end)

-- Capture selection
H:bind({ "option" }, "7", function()
    hs.execute(command .. " -i " .. path)
    H.triggered = true
end)

-- Capture full screen to clipboard
H:bind({}, "8", function()
    hs.execute(command .. " -c " .. path)
    H.triggered = true
end)

-- Capture full screen
H:bind({ "option" }, "8", function()
    hs.execute(command .. path)
    H.triggered = true
end)
