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
  
  local function questTap ( event )
	storyboard.showOverlay( "scenes.QuestOverlay",{ effect = "fade", time = 500, params = {currentQuest = event.target}})
  end
  
  local function scrollListener( event )

    local phase = event.phase
    if ( phase == "began" ) then print( "Scroll view was touched" )
    elseif ( phase == "moved" ) then print( "Scroll view was moved" )
    elseif ( phase == "ended" ) then print( "Scroll view was released" )
    end

    -- In the event a scroll limit is reached...
    if ( event.limitReached ) then
      if ( event.direction == "up" ) then print( "Reached top limit" )
      elseif ( event.direction == "down" ) then print( "Reached bottom limit" )
      elseif ( event.direction == "left" ) then print( "Reached left limit" )
      elseif ( event.direction == "right" ) then print( "Reached right limit" )
      end
    end

    return true
  end

  local scrollView = widget.newScrollView{
    y = display.contentCenterY,
    x = display.contentCenterX,
    width =display.contentWidth,
    height = display.contentHeight,
	friction = 0,
	--isLocked = true,
    --hideBackground = true,
    backgroundColor = { 0.2, 0.2, 0.2 },
    listener = scrollListener
  }
  group:insert(scrollView)
  local land = {}
  local player
  local function moveTo( event )
	print( event.target.x )
	print( event.target.y )
	scrollView:scrollToPosition( { x = (event.target.x - display.contentWidth/2)*-1, y = (event.target.y -display.contentHeight/2)*-1} )
	transition.to( player, { time=400, x=event.target.x ,y=event.target.y}  )
  end
	local myY = 25
	--local i = 0
	local n = 0
	while myY<600 do
		local myX = 25
		while myX<600 do
		  land[n] = display.newRect( myX, myY, 50, 50 )
		  scrollView:insert( land[n] )
		  myX=myX+50
		  local random1 = math.random(0, 255)/255
		  local random2 = math.random(0, 255)/255
		  local random3 = math.random(0, 255)/255
		  land[n]:setFillColor(random1,random2,random3)
		  land[n]:addEventListener( "tap", moveTo )
		  n = n +1
		end
		myY=myY+50
		--i = i +1
	end
	player = display.newRect( 325, 325, 50, 50 )
	player:setFillColor(0,0,0)
	scrollView:insert( player )
	
--[[
  local quests = display.newText( "Quests!", 158, 54 )
  quests.x = 161
  quests.y = 387
  group:insert(quests)

  local function onTapQuests( event )
    storyboard.removeScene( scene )
    storyboard.gotoScene( "scenes.Quests",{ effect = "fade", time = 500,})
  end

  quests:addEventListener("tap", onTapQuests)
]]
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