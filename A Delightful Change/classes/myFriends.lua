local globals = require("classes.globals")
Quest = {}
Quest.__index = Quest

function Quest.makeQuest(name, id, questType, description, rewardIn, rewardOut, rewardKnow)
	local quest = {}             -- our new object
	setmetatable(quest,Quest)
	quest.name = name
	quest.id = id
	quest.questType = questType
	quest.description = description
	quest.rewardIn = rewardIn
	quest.rewardOut = rewardOut
	quest.rewardKnow = rewardKnow
	quest.started = false
	return quest
end
globals.questList[0]= Quest.makeQuest("Hit the switch!", 0, "Indoors", "Conserve electricity and gas.", 15,0,0)
globals.questList[1]= Quest.makeQuest("Meatless Monday!", 1, "Indoors","Don't eat any meat for one whole Monday",5,0,0)
globals.questList[2]= Quest.makeQuest("Water Conservation", 2, "Indoors","Take a 2 minute shower or less. Don't let the water run while washing your hands/brushing you're teeth",10,0,0)
globals.questList[3]= Quest.makeQuest("Spare the air day", 3, "Outside","Don't drive or make any fires for one day",0,15,0)
globals.questList[4]= Quest.makeQuest("Plant tree's!", 4, "Outside","Plant a tree!",0,20,0)
globals.questList[5]= Quest.makeQuest("Join a club", 5, "Knowledge","Join the planetarysociety.org.",0,0,10)
globals.questList[6]= Quest.makeQuest("Share to a friend!", 6, "Knowledge","Share this app to a friend.",0,0,20)
globals.questList[7]= Quest.makeQuest("Read an article", 7, "Knowledge","Read an article based on the topic of climate change.",0,0,10)