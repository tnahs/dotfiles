hs.loadSpoon("ReloadConfiguration")
spoon.ReloadConfiguration:start()

-- Notes ----------------------------------------------------------------------

-- Creating a centered window using {x, y, w, h}:
--    x = 0..1
--    y = 0..1
--    w = 1 - (x * 2)
--    h = 1 - (y * 2)

-- References -----------------------------------------------------------------

-- https://kalis.me/setup-hyper-key-hammerspoon-macos/

-- Hyper ----------------------------------------------------------------------

-- A global variable for Hyper Mode
hyper = hs.hotkey.modal.new({}, nil)

-- Enter Hyper Mode when F20 (Hyper/Capslock) is pressed
function enterHyperMode()
    hyper.triggered = false
    hyper:enter()
end

-- Leave Hyper Mode when F20 (Hyper/Capslock) is pressed
function exitHyperMode()
    hyper:exit()
end

-- Bind the Hyper key
F20 = hs.hotkey.bind({}, "F20", enterHyperMode, exitHyperMode)

-- Utils ----------------------------------------------------------------------

-- Reload Hammerspoon Config
hyper:bind({"command"}, "R", function()
    hs.reload()
    hs.notify.new({
        title = "Hammerspoon",
        informativeText = "Config Reloaded!"
    }):send()
    hyper.triggered = true
end)

-- Apps -----------------------------------------------------------------------

-- Launch/focus an application and return the window
launch_app = function(app_name)
    hs.application.launchOrFocus(app_name)
    hyper.triggered = true
    return hs.application.find(app_name)
end

-- Launch/focus Warp
hyper:bind({"command"}, "T", function()
    launch_app("Warp")
end)

hyper:bind({"option"}, "T", function()
    warp = launch_app("Warp")
    warp:selectMenuItem({"File", "New Window"})
    warp:focusedWindow():move({
        x = 0.0,
        y = 0.0,
        w = 1.0,
        h = 0.6
    })
end)

-- Finder ---------------------------------------------------------------------

-- These map to shortcuts in `System Preferences` > `Keyboard` > `Shortcuts`.

-- Show Mission Control
hyper:bind({}, "3", function()
    hs.eventtap.keyStroke({"command", "option", "shift", "ctrl"}, "3")
    hyper.triggered = true
end)

-- Show application windows
hyper:bind({}, "4", function()
    hs.eventtap.keyStroke({"command", "option", "shift", "ctrl"}, "4")
    hyper.triggered = true
end)

-- Move left a space
hyper:bind({}, "A", function()
    hs.eventtap.keyStroke({"command", "option", "shift", "ctrl"}, "A")
    hyper.triggered = true
end)

-- Move right a space
hyper:bind({}, "D", function()
    hs.eventtap.keyStroke({"command", "option", "shift", "ctrl"}, "D")
    hyper.triggered = true
end)

-- Activate Finder
hyper:bind({}, "F", function()
    finder = hs.application.find("Finder")
    finder:activate()
    hyper.triggered = true
end)

-- Open Home folder
hyper:bind({}, "N", function()
    finder = hs.application.find("Finder")
    finder:selectMenuItem({"Go", "Home"})
    finder:activate()
    finder:focusedWindow():move({
        x = 0.1,
        y = 0.1,
        w = 0.8,
        h = 0.8
    })
    hyper.triggered = true
end)

-- Open Downloads folder
hyper:bind({"command"}, "N", function()
    finder = hs.application.find("Finder")
    finder:selectMenuItem({"Go", "Downloads"})
    finder:activate()
    finder:focusedWindow():move({
        x = 0.1,
        y = 0.1,
        w = 0.8,
        h = 0.8
    })
    hyper.triggered = true
end)

-- Windows --------------------------------------------------------------------

-- Window animation speed [default: 0.2]
hs.window.animationDuration = 0

-- Full-scren window
hyper:bind({}, "space", function()
    hs.window.focusedWindow():move(hs.layout.maximized)
    hyper.triggered = true
end)

-- Screen-left window
hyper:bind({}, "H", function()
    hs.window.focusedWindow():move(hs.layout.left50)
    hyper.triggered = true
end)

-- Screen-right window
hyper:bind({}, "L", function()
    hs.window.focusedWindow():move(hs.layout.right50)
    hyper.triggered = true
end)

-- Screen-top window
hyper:bind({}, "K", function()
    hs.window.focusedWindow():move({
        x = 0.0,
        y = 0.0,
        w = 1.0,
        h = 0.5
    })
    hyper.triggered = true
end)

-- Screen-bottom window
hyper:bind({}, "J", function()
    hs.window.focusedWindow():move({
        x = 0.0,
        y = 0.5,
        w = 1.0,
        h = 0.5
    })
    hyper.triggered = true
end)

-- Terminal window
hyper:bind({}, "T", function()
    hs.window.focusedWindow():move({
        x = 0.0,
        y = 0.0,
        w = 1.0,
        h = 0.6
    })
end)

-- Small wide window
hyper:bind({}, "W", function()
    hs.window.focusedWindow():move({
        x = 0.15,
        y = 0.2,
        w = 0.7,
        h = 0.6
    })
    hyper.triggered = true
end)

-- Large wide window
hyper:bind({}, "E", function()
    hs.window.focusedWindow():move({
        x = 0.1,
        y = 0.1,
        w = 0.8,
        h = 0.8
    })
    hyper.triggered = true
end)

-- Narrow window
hyper:bind({}, "R", function()
    hs.window.focusedWindow():move({
        x = 0.25,
        y = 0.05,
        w = 0.5,
        h = 0.9
    })
    hyper.triggered = true
end)

-- Center window
hyper:bind({}, "C", function()
    hs.window.focusedWindow():centerOnScreen(0)
    hyper.triggered = true
end)

-- Screenshots ----------------------------------------------------------------

-- Capture screenshot
hyper:bind({"command"}, "3", function()
    hs.execute [[ \
        "screencapture" \
        "$HOME/Downloads/screenshot-$(date +%Y-%m-%d-%H%M%S).jpg" \
        ]]
    hyper.triggered = true
end)

-- Capture screenshot interactively
-- -i    Capture screen interactively, by selection or window
hyper:bind({"command"}, "4", function()
    hs.execute [[\
        "screencapture" \
        "-i" \
        "$HOME/Downloads/screenshot-$(date +%Y-%m-%d-%H%M%S).jpg" \
        ]]
    hyper.triggered = true
end)

-- Capture screenshot with UI
-- -i    Capture screen interactively, by selection or window
-- -U    Show interactive toolbar in interactive mode
hyper:bind({"command"}, "5", function()
    hs.execute [[ \
        "screencapture" \
        "-iU" \
        "$HOME/Downloads/screenshot-$(date +%Y-%m-%d-%H%M%S).jpg" \
        ]]
    hyper.triggered = true
end)
