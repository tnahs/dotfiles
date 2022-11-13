-- References -----------------------------------------------------------------

-- https://kalis.me/setup-hyper-key-hammerspoon-macos/

-- Notes ----------------------------------------------------------------------

-- Creating a centered window using {x, y, w, h}:
--    x = 0..1
--    y = 0..1
--    w = 1 - (x * 2)
--    h = 1 - (y * 2)

--------------------------------------------------------------------------------

H = require("config.hyper")

require("config.apps")
require("config.finder")
require("config.screenshots")
require("config.windows")

-- Spoons ----------------------------------------------------------------------

hs.loadSpoon("ReloadConfiguration")
spoon.ReloadConfiguration:start()

-- Application Bundle IDs -----------------------------------------------------

AppIds = {
    firefox = "org.mozilla.firefox",
    orion = "com.kagi.kagimacOS",
    kitty = "net.kovidgoyal.kitty",
    screenshot = "com.apple.screenshot.launcher",
}
