-- Terminal --------------------------------------------------------------------

-- Focus terminal
H:bind({}, "T", function()
    local app = hs.application.open(Apps.terminal)
    app:activate()
    H.triggered = true
end)

-- Open a new terminal window
H:bind({ "command" }, "T", function()
    local app = hs.application.open(Apps.terminal)
    app:activate()
    hs.eventtap.keyStroke({ "command" }, "N")
    H.triggered = true
end)

-- Browser ---------------------------------------------------------------------

-- Focus browser
H:bind({}, "B", function()
    local app = hs.application.open(Apps.browser)
    app:activate()
    H.triggered = true
end)

-- Open a new browser window
H:bind({ "command" }, "B", function()
    local app = hs.application.open(Apps.browser)
    app:activate()
    hs.eventtap.keyStroke({ "command" }, "N")
    H.triggered = true
end)

-- Raycast ---------------------------------------------------------------------

-- Trigger Raycast to search bookmarks via Raindrop.io
-- Set `Search Bookmarks` command to: `control-option-shift`
H:bind({}, "M", function()
    hs.eventtap.keyStroke({ "option", "shift", "ctrl" }, "M")
    H.triggered = true
end)

-- Trigger Raycast to show latest bookmarks via Raindrop.io
-- Set `Latest Bookmarks` command to: `command-control-option-shift`
H:bind({ "command" }, "M", function()
    hs.eventtap.keyStroke({ "command", "ctrl", "option", "shift" }, "M")
    H.triggered = true
end)
