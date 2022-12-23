-- Finder ---------------------------------------------------------------------

-- These map to shortcuts in `System Preferences` > `Keyboard` > `Shortcuts`.

-- Show Mission Control
H:bind({}, "3", function()
    hs.eventtap.keyStroke(H.modifiers, "3")
    H.triggered = true
end)

-- Show application windows
H:bind({}, "4", function()
    hs.eventtap.keyStroke(H.modifiers, "4")
    H.triggered = true
end)

-- Move left a space
H:bind({}, "A", function()
    hs.eventtap.keyStroke(H.modifiers, "A")
    H.triggered = true
end)

-- Move right a space
H:bind({}, "D", function()
    hs.eventtap.keyStroke(H.modifiers, "D")
    H.triggered = true
end)

-------------------------------------------------------------------------------

-- Focus Finder
H:bind({}, "F", function()
    local finder = hs.application.open("Finder")
    finder:activate()
    H.triggered = true
end)

-- Open new Finder window
H:bind({ "command" }, "F", function()
    hs.execute("open $HOME")
    H.triggered = true
end)

-- Open Downloads folder
H:bind({ "command" }, "D", function()
    hs.execute("open $HOME/Downloads")
    H.triggered = true
end)
