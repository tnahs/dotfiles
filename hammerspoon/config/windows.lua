-- Windows --------------------------------------------------------------------

-- Window animation speed [default: 0.2]
hs.window.animationDuration = 0

-- Full-scren window
H:bind({}, "space", function()
    hs.window.focusedWindow():move(hs.layout.maximized)
    H.triggered = true
end)

-- Screen-left window
H:bind({ "command" }, "H", function()
    hs.window.focusedWindow():move(hs.layout.left50)
    H.triggered = true
end)

-- Screen-right window
H:bind({ "command" }, "L", function()
    hs.window.focusedWindow():move(hs.layout.right50)
    H.triggered = true
end)

-- Screen-top window
H:bind({ "command" }, "K", function()
    hs.window.focusedWindow():move({
        x = 0.0,
        y = 0.0,
        w = 1.0,
        h = 0.5,
    })
    H.triggered = true
end)

-- Screen-bottom window
H:bind({ "command" }, "J", function()
    hs.window.focusedWindow():move({
        x = 0.0,
        y = 0.5,
        w = 1.0,
        h = 0.5,
    })
    H.triggered = true
end)

-- Small wide window
H:bind({ "command" }, "S", function()
    hs.window.focusedWindow():move({
        x = 0.15,
        y = 0.2,
        w = 0.7,
        h = 0.6,
    })
    H.triggered = true
end)

-- Large wide window (default)
H:bind({ "command" }, "E", function()
    hs.window.focusedWindow():move({
        x = 0.1,
        y = 0.1,
        w = 0.8,
        h = 0.8,
    })
    H.triggered = true
end)

-- Narrow window
H:bind({ "command" }, "R", function()
    hs.window.focusedWindow():move({
        x = 0.25,
        y = 0.05,
        w = 0.5,
        h = 0.9,
    })
    H.triggered = true
end)

-- Move window to center
H:bind({ "command" }, "C", function()
    hs.window.focusedWindow():centerOnScreen(0)
    H.triggered = true
end)
