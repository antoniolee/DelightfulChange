 ---------------------------------------------------------------------------------
-- Multiplayer Screen
-- Scene notes go here
---------------------------------------------------------------------------------
 
local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
local widget = require( "widget" )
local globals = require("classes.globals")
require("classes.myQuests")
 
-- Clear previous scene
storyboard.removeAll()
 
-- local forward references should go here --
 
---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------
 
-- Called when the scene's view does not exist:
function scene:createScene( event )
  local group = self.view
  local titleOptions = {
    text = "Friends",
    x = 160,
    y = 70,   
    font = globals.Archistico,
    fontSize = 48
  }
  local title = display.newText(titleOptions)
  title:setFillColor(0,0.392157,0)
  group:insert(title)
  
  local indoor = display.newText( "Indoor: 50", 250, 75, globals.Aaargh, 14 )
  indoor:setFillColor(0,0.392157,0)
  indoor.x = display.contentCenterX-85
  indoor.y = 15
  group:insert(indoor)
  
  local outside = display.newText( "Outside: 50", 250, 75, globals.Aaargh, 14 )
  outside:setFillColor(0,0.392157,0)
  outside.x = display.contentCenterX
  outside.y = 15
  group:insert(outside)
  
  local knowledge = display.newText( "Knowledge: 50", 250, 75, globals.Aaargh, 14 )
  knowledge:setFillColor(0,0.392157,0)
  knowledge.x = display.contentCenterX+100
  knowledge.y = 15
  group:insert(knowledge)
  
  local function onTapBack( event )
    storyboard.removeScene( scene )
    storyboard.gotoScene( "scenes.HomeScreen",{ effect = "fade", time = 500,})
  end
  
  local back = display.newImageRect( "images/leftArrow.png", 20, 20 )
  back.x = 15
  back.y = 15
  back:addEventListener("tap", onTapBack)
  group:insert(back)
  
 local friend1 = display.newImageRect( "images/breakfast.png", 65, 65 )
  friend1.x = 74
  friend1.y = 164
  group:insert(friend1)

  local friend2 = display.newImageRect( "images/archer.png", 65, 65 )
  friend2.x = 243
  friend2.y = 164
  group:insert(friend2)

  local friend3 = display.newImageRect( "images/penguinknight1.png", 80, 80 )
  friend3.x = 162
  friend3.y = 159
  group:insert(friend3)

  local infoOptions = {
    text = "This is penguin man, you're first buddy. You can visit his world and do cool things like plant trees!",
    x = 160,
    y = 305,   
    font = globals.Aaargh,
    fontSize = 14,
    width = 256,
  }  

  local info = display.newText(infoOptions)
  info:setFillColor(0,0.392157,0)
  group:insert(info)

  local friendName = display.newText( "Penguin Man", 250, 75, globals.Aaargh, 28 )
  friendName:setFillColor(0,0.392157,0)
  friendName.x = display.contentCenterX
  friendName.y = 240
  group:insert(friendName)


  local function onTapReturn( event )
    storyboard.removeScene( scene )
    storyboard.gotoScene( "scenes.HomeScreen",{ effect = "fade", time = 500,})
  end

  --returnBut:addEventListener("tap", onTapReturn)

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