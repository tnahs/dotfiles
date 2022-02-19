hs.loadSpoon("ReloadConfiguration")
spoon.ReloadConfiguration:start()

-- Hyper ----------------------------------------------------------------------

local hyper = {"ctrl", "alt", "shift"}
local hyperc = {"ctrl", "alt", "shift", "cmd"}

-- Utils ----------------------------------------------------------------------

-- Creating a centered window:
--    x = starting x
--    y = starting y
--    w = 1 - (x * 2)
--    h = 1 - (y * 2)

-- Activate Finder
hs.hotkey.bind(hyperc, "R", function()
    hs.reload()
    hs.notify.new({
        title = "Hammerspoon",
        informativeText = "Config Reloaded!"
    }):send()
end)

-- Finder ---------------------------------------------------------------------

-- Activate Finder
hs.hotkey.bind(hyper, "F", function()
    finder = hs.application.find("Finder")
    finder:activate()
end)

-- Open Home folder
hs.hotkey.bind(hyper, "N", function()
    finder = hs.application.find("Finder")
    finder:selectMenuItem({"Go", "Home"})
    finder:activate()
    finder:focusedWindow():move({
        x = 0.1,
        y = 0.1,
        w = 0.8,
        h = 0.8
    })
end)

-- Open Downloads folder
hs.hotkey.bind(hyperc, "N", function()
    finder = hs.application.find("Finder")
    finder:selectMenuItem({"Go", "Downloads"})
    finder:activate()
    finder:focusedWindow():move({
        x = 0.1,
        y = 0.1,
        w = 0.8,
        h = 0.8
    })
end)

-- Windows --------------------------------------------------------------------

-- Window animation speed [default: 0.2]
hs.window.animationDuration = 0

-- Full-scren window
hs.hotkey.bind(hyper, "U", function()
    hs.window.focusedWindow():move(hs.layout.maximized)
end)

-- Screen-left window
hs.hotkey.bind(hyper, "H", function()
    hs.window.focusedWindow():move(hs.layout.left50)
end)

-- Screen-right window
hs.hotkey.bind(hyper, "L", function()
    hs.window.focusedWindow():move(hs.layout.right50)
end)

-- Screen-top window
hs.hotkey.bind(hyper, "K", function()
    hs.window.focusedWindow():move({
        x = 0.0,
        y = 0.0,
        w = 1.0,
        h = 0.5
    })
end)

-- Screen-bottom window
hs.hotkey.bind(hyper, "J", function()
    hs.window.focusedWindow():move({
        x = 0.0,
        y = 0.5,
        w = 1.0,
        h = 0.5
    })
end)

-- Small wide window
hs.hotkey.bind(hyper, "W", function()
    hs.window.focusedWindow():move({
        x = 0.15,
        y = 0.2,
        w = 0.7,
        h = 0.6
    })
end)

-- Large wide window
hs.hotkey.bind(hyper, "E", function()
    hs.window.focusedWindow():move({
        x = 0.1,
        y = 0.1,
        w = 0.8,
        h = 0.8
    })
end)

-- Narrow window
hs.hotkey.bind(hyper, "R", function()
    hs.window.focusedWindow():move({
        x = 0.25,
        y = 0.05,
        w = 0.5,
        h = 0.9
    })
end)

-- Center window
hs.hotkey.bind(hyper, "C", function()
    hs.window.focusedWindow():centerOnScreen(0)
end)

-- Screenshots ----------------------------------------------------------------

-- Capture screenshot
hs.hotkey.bind(hyperc, "3", function()
    hs.execute [[ \
        "screencapture" \
        "$HOME/Downloads/screenshot-$(date +%Y-%m-%d-%H%M%S).jpg" \
        ]]
end)

-- Capture screenshot interactively
-- -i    Capture screen interactively, by selection or window
hs.hotkey.bind(hyperc, "4", function()
    hs.execute [[\
        "screencapture" \
        "-i" \
        "$HOME/Downloads/screenshot-$(date +%Y-%m-%d-%H%M%S).jpg" \
        ]]
end)

-- Capture screenshot with UI
-- -i    Capture screen interactively, by selection or window
-- -U    Show interactive toolbar in interactive mode
hs.hotkey.bind(hyperc, "5", function()
    hs.execute [[ \
        "screencapture" \
        "-iU" \
        "$HOME/Downloads/screenshot-$(date +%Y-%m-%d-%H%M%S).jpg" \
        ]]
end)
