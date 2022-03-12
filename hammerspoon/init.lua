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
HYPER = hs.hotkey.modal.new({}, nil)

-- Enter Hyper Mode when F20 (Hyper/Capslock) is pressed
local function enter_hyper_mode()
    HYPER.triggered = false
    HYPER:enter()
end

-- Leave Hyper Mode when F20 (Hyper/Capslock) is pressed
local function exit_hyper_mode()
    HYPER:exit()
end

-- Bind the Hyper key
F20 = hs.hotkey.bind({}, "F20", enter_hyper_mode, exit_hyper_mode)

-- Utils ----------------------------------------------------------------------

-- Reload Hammerspoon Config
HYPER:bind({ "command" }, "R", function()
    hs.reload()
    hs.notify.new({
        title = "Hammerspoon",
        informativeText = "Config Reloaded!",
    }):send()
    HYPER.triggered = true
end)

-- Finder ---------------------------------------------------------------------

-- These map to shortcuts in `System Preferences` > `Keyboard` > `Shortcuts`.

-- Show Mission Control
HYPER:bind({}, "3", function()
    hs.eventtap.keyStroke({ "command", "option", "shift", "ctrl" }, "3")
    HYPER.triggered = true
end)

-- Show application windows
HYPER:bind({}, "4", function()
    hs.eventtap.keyStroke({ "command", "option", "shift", "ctrl" }, "4")
    HYPER.triggered = true
end)

-- Move left a space
HYPER:bind({}, "A", function()
    hs.eventtap.keyStroke({ "command", "option", "shift", "ctrl" }, "A")
    HYPER.triggered = true
end)

-- Move right a space
HYPER:bind({}, "D", function()
    hs.eventtap.keyStroke({ "command", "option", "shift", "ctrl" }, "D")
    HYPER.triggered = true
end)

-- Activate Finder
HYPER:bind({}, "F", function()
    local finder = hs.application.find("Finder")
    finder:activate()
    HYPER.triggered = true
end)

-- Open Home folder
HYPER:bind({}, "N", function()
    local finder = hs.application.find("Finder")
    finder:selectMenuItem({ "Go", "Home" })
    finder:activate()
    finder:focusedWindow():move({
        x = 0.1,
        y = 0.1,
        w = 0.8,
        h = 0.8,
    })
    HYPER.triggered = true
end)

-- Open Downloads folder
HYPER:bind({ "command" }, "N", function()
    local finder = hs.application.find("Finder")
    finder:selectMenuItem({ "Go", "Downloads" })
    finder:activate()
    finder:focusedWindow():move({
        x = 0.1,
        y = 0.1,
        w = 0.8,
        h = 0.8,
    })
    HYPER.triggered = true
end)

-- Windows --------------------------------------------------------------------

-- Window animation speed [default: 0.2]
hs.window.animationDuration = 0

-- Full-scren window
HYPER:bind({}, "space", function()
    hs.window.focusedWindow():move(hs.layout.maximized)
    HYPER.triggered = true
end)

-- Screen-left window
HYPER:bind({}, "H", function()
    hs.window.focusedWindow():move(hs.layout.left50)
    HYPER.triggered = true
end)

-- Screen-right window
HYPER:bind({}, "L", function()
    hs.window.focusedWindow():move(hs.layout.right50)
    HYPER.triggered = true
end)

-- Screen-top window
HYPER:bind({}, "K", function()
    hs.window.focusedWindow():move({
        x = 0.0,
        y = 0.0,
        w = 1.0,
        h = 0.5,
    })
    HYPER.triggered = true
end)

-- Screen-bottom window
HYPER:bind({}, "J", function()
    hs.window.focusedWindow():move({
        x = 0.0,
        y = 0.5,
        w = 1.0,
        h = 0.5,
    })
    HYPER.triggered = true
end)

-- Terminal window
HYPER:bind({}, "T", function()
    hs.window.focusedWindow():move({
        x = 0.0,
        y = 0.0,
        w = 1.0,
        h = 0.6,
    })
end)

-- Small wide window
HYPER:bind({}, "W", function()
    hs.window.focusedWindow():move({
        x = 0.15,
        y = 0.2,
        w = 0.7,
        h = 0.6,
    })
    HYPER.triggered = true
end)

-- Large wide window
HYPER:bind({}, "E", function()
    hs.window.focusedWindow():move({
        x = 0.1,
        y = 0.1,
        w = 0.8,
        h = 0.8,
    })
    HYPER.triggered = true
end)

-- Narrow window
HYPER:bind({}, "R", function()
    hs.window.focusedWindow():move({
        x = 0.25,
        y = 0.05,
        w = 0.5,
        h = 0.9,
    })
    HYPER.triggered = true
end)

-- Center window
HYPER:bind({}, "C", function()
    hs.window.focusedWindow():centerOnScreen(0)
    HYPER.triggered = true
end)

-- Screenshots ----------------------------------------------------------------

local command = "screencapture"
local path = "$HOME/Downloads/screenshot-$(date +%Y-%m-%d-%H%M%S).png"

-- Capture full screen
HYPER:bind({}, "5", function()
    hs.execute(command .. " " .. path)
    HYPER.triggered = true
end)

-- Capture selection
-- -i    Capture screen interactively, by selection or window
HYPER:bind({}, "6", function()
    hs.execute(command .. " -i " .. path)
    HYPER.triggered = true
end)

-- Capture window
-- -i    Capture screen interactively, by selection or window
-- -W    Start interaction in window selection mode
-- -o    In window capture mode, do not capture the shadow of the window
HYPER:bind({}, "7", function()
    hs.execute(command .. " -iWo " .. path)
    HYPER.triggered = true
end)
