-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
display.setStatusBar( display.HiddenStatusBar )
local storyboard = require ("storyboard")
local globals = require ("classes.globals")

-- load scenetemplate.lua
storyboard.gotoScene( "scenes.HomeScreen")

-- Add any objects that should appear on all scenes below (e.g. tab bar, hud, etc.):""


