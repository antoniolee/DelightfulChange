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
globals.questList[0]= Quest.makeQuest("SAVE THE PLANET", 0, "Outside", "Go out into the awesome world and gather a new understanding for it and how it works!", 0,4,0)