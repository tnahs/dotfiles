hs.loadSpoon("ReloadConfiguration")
spoon.ReloadConfiguration:start()

-- Hyper ----------------------------------------------------------------------

local hyper = {"ctrl", "alt", "shift"}
local hyper_cmd = {"ctrl", "alt", "shift", "cmd"}

-- Finder ---------------------------------------------------------------------

-- New Finder window
hs.hotkey.bind(hyper, "N", function()
    hs.execute [["open" "$HOME"]]
    hs.window.focusedWindow():moveToUnit "[010,010,090,090]"
    hs.window.focusedWindow():centerOnScreen()
end)

-- Screenshots ----------------------------------------------------------------

-- Capture screenshot
hs.hotkey.bind(hyper_cmd, "3", function()
    hs.execute [[ \
        "screencapture" \
        "$HOME/Downloads/screenshot-$(date +%Y-%m-%d-%H%M%S).jpg" \
        ]]
end)

-- Capture screenshot interactively
-- -i    Capture screen interactively, by selection or window
hs.hotkey.bind(hyper_cmd, "4", function()
    hs.execute [[\
        "screencapture" \
        "-i" \
        "$HOME/Downloads/screenshot-$(date +%Y-%m-%d-%H%M%S).jpg" \
        ]]
end)

-- Capture screenshot with UI
-- -i    Capture screen interactively, by selection or window
-- -U    Show interactive toolbar in interactive mode
hs.hotkey.bind(hyper_cmd, "5", function()
    hs.execute [[ \
        "screencapture" \
        "-iU" \
        "$HOME/Downloads/screenshot-$(date +%Y-%m-%d-%H%M%S).jpg" \
        ]]
end)


-- Windows --------------------------------------------------------------------

-- Window animation speed [default: 0.2]
hs.window.animationDuration = 0.1

-- Full-scren window
hs.hotkey.bind(hyper, "U", function()
    hs.window.focusedWindow():moveToUnit(hs.layout.maximized)
end)

-- Screen-left window
hs.hotkey.bind(hyper, "H", function()
    hs.window.focusedWindow():moveToUnit(hs.layout.left50)
end)

-- Screen-bottom window
hs.hotkey.bind(hyper, "J", function()
    hs.window.focusedWindow():moveToUnit "[000,050,100,100]"
end)

-- Screen-top window
hs.hotkey.bind(hyper, "K", function()
    hs.window.focusedWindow():moveToUnit "[000,000,100,050]"
end)

-- Screen-right window
hs.hotkey.bind(hyper, "L", function()
    hs.window.focusedWindow():moveToUnit(hs.layout.right50)
end)

-- Small wide window
hs.hotkey.bind(hyper, "W", function()
    hs.window.focusedWindow():moveToUnit "[020,025,080,075]"
end)

-- Large wide window
hs.hotkey.bind(hyper, "E", function()
    hs.window.focusedWindow():moveToUnit "[010,010,090,090]"
end)

-- Narrow window
hs.hotkey.bind(hyper, "R", function()
    hs.window.focusedWindow():moveToUnit "[025,005,075,095]"
end)

-- Center window
hs.hotkey.bind(hyper, "C", function()
    hs.window.focusedWindow():centerOnScreen()
end)
