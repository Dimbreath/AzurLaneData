slot3[1] = {
	active = true,
	name = "miaoMove"
}
slot2.effects = {}
slot2.typewriter = {
	speed = 0.05,
	speedUp = 0.01
}
slot1[1] = {
	bgName = "bg_story_task",
	say = "————！~~~"
}
slot2.typewriter = {
	speed = 0.05,
	speedUp = 0.01
}
slot2.painting = {
	alpha = 0.3,
	time = 1
}
slot2.actorPosition = {
	x = -750,
	y = 0
}
slot3[1] = {
	y = 0,
	dur = 0.5,
	x = 750,
	type = "move"
}
slot2.action = {}
slot1[2] = {
	side = 2,
	bgName = "bg_story_task",
	dir = 1,
	actor = 312010,
	nameColor = "#a9f548",
	say = "喵啊啊啊啊！不可以乱跑喵！！"
}
slot2.typewriter = {
	speed = 0.05,
	speedUp = 0.01
}
slot2.painting = {
	alpha = 0.3,
	time = 1
}
slot1[3] = {
	actor = 312010,
	side = 2,
	bgName = "bg_story_task",
	nameColor = "#a9f548",
	dir = 1,
	say = "呼喵？指挥官回来了喵？来的正好喵！快帮{namecode:98}抓住这小东西喵！"
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
slot3[1] = {
	active = false,
	name = "miaoMove"
}
slot2.effects = {}
slot2.typewriter = {
	speed = 0.05,
	speedUp = 0.01
}
slot2.painting = {
	alpha = 0.3,
	time = 1
}
slot1[4] = {
	actor = 312010,
	side = 2,
	dir = 1,
	bgName = "bg_story_task",
	nameColor = "#a9f548",
	say = "呼喵…指挥官帮大忙了喵。"
}
slot2.typewriter = {
	speed = 0.05,
	speedUp = 0.01
}
slot2.painting = {
	alpha = 0.3,
	time = 1
}
slot1[5] = {
	actor = 312010,
	side = 2,
	bgName = "bg_story_task",
	nameColor = "#a9f548",
	dir = 1,
	say = "这个是什么喵？哼哼，问得好！这些小家伙正是{namecode:98}和港区的研究小组们最新的心血结晶——"
}
slot3[1] = {
	active = true,
	name = "miaoShow"
}
slot2.effects = {}
slot2.typewriter = {
	speed = 0.05,
	speedUp = 0.01
}
slot2.painting = {
	alpha = 0.3,
	time = 1
}
slot1[6] = {
	say = "——指挥喵！！",
	side = 2,
	bgName = "bg_story_task",
	dir = 1,
	actor = 312010,
	nameColor = "#a9f548",
	withoutPainting = true
}
slot3[1] = {
	active = false,
	name = "miaoShow"
}
slot2.effects = {}
slot2.typewriter = {
	speed = 0.05,
	speedUp = 0.01
}
slot2.painting = {
	alpha = 0.3,
	time = 1
}
slot1[7] = {
	actor = 312010,
	side = 2,
	bgName = "bg_story_task",
	dir = 1,
	blackBg = true,
	nameColor = "#a9f548",
	say = "就让{namecode:98}来给你介绍介绍喵！"
}
slot0.scripts = {}

return {
	mode = 2,
	once = true,
	id = "ZHIHUIMIAO1",
	fadein = 1.5
}
