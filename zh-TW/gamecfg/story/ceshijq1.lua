slot3[1] = {
	"剧情测试\n\n<size=45>SP2剧情</size>",
	1
}
slot2.sequence = {}
slot1[1] = {
	mode = 1,
	stopbgm = true
}
slot3.alpha = {
	0,
	1
}
slot2.flashout = {
	dur = 1,
	black = true
}
slot3.alpha = {
	1,
	0
}
slot2.flashin = {
	delay = 1,
	dur = 1,
	black = true
}
slot2.typewriter = {
	speed = 0.05,
	speedUp = 0.01
}
slot1[2] = {
	side = 2,
	bgName = "bg_story_task",
	dir = 1,
	bgmDelay = 2,
	bgm = "story-1",
	say = "SP2·剧情点测试"
}
slot2.typewriter = {
	speed = 0.05,
	speedUp = 0.01
}
slot1[3] = {
	actor = 808010,
	side = 2,
	bgName = "bg_story_task",
	nameColor = "#a9f548",
	dir = 1,
	say = "测试剧情"
}
slot2.typewriter = {
	speed = 0.05,
	speedUp = 0.01
}
slot1[4] = {
	side = 2,
	bgName = "bg_story_task",
	dir = 1,
	optionFlag = 2,
	say = "测试剧情结束。"
}
slot2.typewriter = {
	speed = 0.05,
	speedUp = 0.01
}
slot1[5] = {
	side = 2,
	bgName = "bg_story_task",
	dir = 1,
	blackBg = true,
	say = "…………"
}
slot0.scripts = {}

return {
	fadeOut = 1.5,
	mode = 2,
	fadeType = 2,
	once = true,
	id = "CESHIJQ1",
	fadein = 1.5
}
