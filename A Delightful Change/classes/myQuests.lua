local globals = require("classes.globals")
Quest = {}
Quest.__index = Quest

function Quest.makeQuest(name, id, questType, description, reward)
	local quest = {}             -- our new object
	setmetatable(quest,Quest)
	quest.name = name
	quest.id = id
	quest.questType = questType
	quest.description = description
	quest.reward = reward
	return quest
end
globals.questList[0]= Quest.makeQuest("SAVE THE PLANET", 1, "Outside", "GO OUT AND SAVE IT!", {0,4,0})