-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
display.setStatusBar( display.HiddenStatusBar )
local storyboard = require ("storyboard")
local globals = require ("classes.globals")
display.setDefault( "background", .976, .949, .906 )

centerX = display.contentCenterX
centerY = display.contentCenterY
_W = display.contentWidth
_H = display.contentHeight

local fonts = native.getFontNames()
count = 0
for i,fontname in ipairs(fonts) do
    count = count+1
end

--print( "\rFont count = " .. count )

local name = "pt"     -- part of the Font name we are looking for

name = string.lower( name )

if "Win" == system.getInfo( "platformName" ) then
    globals.Archistico = "Archistico"
	globals.Aaargh = "Aaargh"
  elseif "Android" == system.getInfo( "platformName" ) then
    globals.Archistico = "Archistico-Bold"
	globals.Aaargh = "Aaargh"
  else
    -- Mac and iOS
    globals.Archistico = "Archistico"
	globals.Aaargh = "Aaargh"
  end


-- Display each font in the terminal console
for i, fontname in ipairs(fonts) do
    j, k = string.find( string.lower( fontname ), name )

    if( j ~= nil ) then

        --print( "fontname = " .. tostring( fontname ) )

    end
end
-- load scenetemplate.lua
storyboard.gotoScene( "scenes.HomeScreen")

-- Add any objects that should appear on all scenes below (e.g. tab bar, hud, etc.):""
