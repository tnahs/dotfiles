-- Applications  ---------------------------------------------------------------

-- Focus terminal
H:bind({}, "T", function()
    local app = hs.application.open(AppIds.kitty)
    app:activate()
    H.triggered = true
end)

-- Open new terminal window
H:bind({ "command" }, "T", function()
    local app = hs.application.open(AppIds.kitty)
    app:activate()
    app:selectMenuItem({ "Shell", "New OS Window" })
    H.triggered = true
end)

-- Focus browser
H:bind({}, "B", function()
    local app = hs.application.open(AppIds.firefox)
    app:activate()
    H.triggered = true
end)

-- Open new browser window
H:bind({ "command" }, "B", function()
    local app = hs.application.open(AppIds.firefox)
    app:activate()
    app:selectMenuItem({ "File", "New Window" })
    H.triggered = true
end)
