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
  local titleOptions = {
    text = "Quests!",
    x = 160,
    y = 70,   
    font = globals.Archistico,
    fontSize = 48
  }
  local title = display.newText(titleOptions)
  title:setFillColor(0,0.392157,0)
  group:insert(title)
  
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
    y = 220,
    x = display.contentCenterX,
    width = 200,
    height = 220,
    topPadding = 20,
    --hideBackground = true,
    horizontalScrollDisabled = true,
    backgroundColor = { 0.2, 0.2, 0.2 },
    listener = scrollListener
  }
  group:insert(scrollView)
	local questToDo = {}
	local myY = 0
	for i = 0,table.maxn( globals.questList ) do
		  questToDo[i] = display.newText( globals.questList[i].name, 0, 0, globals.IMPRIMA, 18 )
		  questToDo[i].anchorX = 0
		  --questToDo[i]:setFillColor(white)
		  questToDo[i].x = 20--scrollView.contentBounds.xMin
		  questToDo[i].y = myY
		  questToDo[i].id = i
		  questToDo[i].name = globals.questList[i].name
		  questToDo[i].image = globals.questList[i].image
		  questToDo[i].description = globals.questList[i].description
		  questToDo[i].toUse = globals.questList[i].toUse
		  questToDo[i].lockLevel = globals.questList[i].lockLevel
		  questToDo[i].cost = globals.questList[i].cost
		  scrollView:insert( questToDo[i] )
		  myY=myY+35
		  questToDo[i]:addEventListener( "tap", questTap )
	end

  local returnBut = display.newText( "Return", 158, 54, globals.Aaargh, 36 )
  returnBut:setFillColor(0.2509,0.7529,0.7960)
  returnBut.x = 161
  returnBut.y = 387
  group:insert(returnBut)

  local function onTapReturn( event )
    storyboard.removeScene( scene )
    storyboard.gotoScene( "scenes.HomeScreen",{ effect = "fade", time = 500,})
  end

  returnBut:addEventListener("tap", onTapReturn)

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