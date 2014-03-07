---------------------------------------------------------------------------------
-- Home Screen
-- Scene notes go here
---------------------------------------------------------------------------------
 
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
local globals = require("classes.globals")
 
-- Clear previous scene
storyboard.removeAll()
 
-- local forward references should go here --
 
---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------
 
-- Called when the scene's view does not exist:
function scene:createScene( event )
  local group = self.view
  print(globals.Archistico)
  local title1 = display.newText( "A", 250, 75, globals.Archistico, 48 )
  title1:setFillColor(0,0.392157,0)
  title1.x = 159
  title1.y = 33
  group:insert(title1)
  
  local title2 = display.newText( "Delightful", 250, 75, globals.Archistico, 48 )
  title2:setFillColor(0,0.392157,0)
  title2.x = 159
  title2.y = 73
  group:insert(title2)

  local title3 = display.newText( "Change!", 250, 75, globals.Archistico, 48 )
  title3:setFillColor(0,0.392157,0)
  title3.x = 159
  title3.y = 113
  group:insert(title3)
  
  local world = display.newImageRect( "images/world.jpg", 150, 150 )
  world.x = 162
  world.y = 230
  group:insert(world)

  local quests = display.newText( "Quests!", 158, 54, globals.Aaargh, 36 )
  quests:setFillColor(0.2509,0.7529,0.7960)
  quests.x = 161
  quests.y = 387
  group:insert(quests)

  local function onTapQuests( event )
    storyboard.removeScene( scene )
    storyboard.gotoScene( "scenes.Quests",{ effect = "fade", time = 500,})
  end

  quests:addEventListener("tap", onTapQuests)

end
 
-- Called BEFORE scene has moved onscreen:
function scene:willEnterScene( event )
  local group = self.view
 
end
 
-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
  local group = self.view
 
end
 
-- Called when scene is about to move offscreen:
function scene:exitScene( event )
  local group = self.view
 
end
 
-- Called AFTER scene has finished moving offscreen:
function scene:didExitScene( event )
  local group = self.view
 
end
 
-- Called prior to the removal of scene's "view" (display view)
function scene:destroyScene( event )
  local group = self.view
 
end
 
-- Called if/when overlay scene is displayed via storyboard.showOverlay()
function scene:overlayBegan( event )
  local group = self.view
  local overlay_name = event.sceneName  -- name of the overlay scene
 
end
 
-- Called if/when overlay scene is hidden/removed via storyboard.hideOverlay()
function scene:overlayEnded( event )
  local group = self.view
  local overlay_name = event.sceneName  -- name of the overlay scene
 
end
 
---------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------
 
-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene", scene )
 
-- "willEnterScene" event is dispatched before scene transition begins
scene:addEventListener( "willEnterScene", scene )
 
-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene )
 
-- "exitScene" event is dispatched before next scene's transition begins
scene:addEventListener( "exitScene", scene )
 
-- "didExitScene" event is dispatched after scene has finished transitioning out
scene:addEventListener( "didExitScene", scene )
 
-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )
 
-- "overlayBegan" event is dispatched when an overlay scene is shown
scene:addEventListener( "overlayBegan", scene )
 
-- "overlayEnded" event is dispatched when an overlay scene is hidden/removed
scene:addEventListener( "overlayEnded", scene )
 
---------------------------------------------------------------------------------
 
return scene