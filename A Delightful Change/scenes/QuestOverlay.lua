 ---------------------------------------------------------------------------------
-- Quests Screen
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
  
  local params = event.params
  currentQuest = params.currentQuest
  print(currentQuest.name)
  local bkg = display.newRect( centerX, centerY, display.contentWidth, display.contentHeight )
  bkg:setFillColor( gray )
  bkg.alpha = .5
  group:insert (bkg)

  local titleBkg = display.newRect( centerX, centerY, display.contentWidth-40, display.contentHeight-200 )
  group:insert (titleBkg)
  
  bkg:addEventListener("touch", function() return true end)
  bkg:addEventListener("tap", function() return true end)
  
  local title = display.newText( currentQuest.name, 250, 75, globals.Archistico, 26 )
  title:setFillColor(0,0.392157,0)
  title.x = 159
  title.y = 130
  group:insert(title)
  
 -- local content = display.newText( "Goal: " .. currentQuest.description, 250, 75, globals.Aaargh, 26 )
  local content = display.newText( "Goal: " .. currentQuest.description, 165, 360, display.contentWidth-60, 400, globals.Aaargh, 18 )
  content:setFillColor(0,0,0)
  group:insert(content)
  
  local reward = display.newText( "Reward: 0 Indoor, 4 Outdoor, 0 Knowledge", 250, 75, globals.Aaargh, 18 )
  reward:setFillColor(0,0,0)
  reward.x = 165
  reward.y = 270
  group:insert(reward)
  local function acceptTap ()
	globals.questList[currentQuest.id].started = true
	storyboard.hideOverlay( "fade", 500)
  end
  
  local function completeTap ()
	--globals.questList[0].started = true
	storyboard.hideOverlay( "fade", 500)
  end
  
  if ( globals.questList[currentQuest.id].started == false ) then
	  local accept = display.newText( "Accept", 250, 75, globals.Archistico, 26 )
	  accept:setFillColor(0,0,0)
	  accept.x = 165
	  accept.y = 310
	  accept:addEventListener( "tap", acceptTap )
	  group:insert(accept)
  else
	  local complete = display.newText( "Complete Task!", 250, 75, globals.Archistico, 26 )
	  complete:setFillColor(0,0,0)
	  complete.x = 165
	  complete.y = 310
	  complete:addEventListener( "tap", completeTap )
	  group:insert(complete)
	end
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