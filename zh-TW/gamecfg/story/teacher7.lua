slot3[1] = {
	"36年Z组 Z23老师\n\n<size=45>七 教教我吧，Z23老师！</size>",
	1
}
slot2.sequence = {}
slot1[1] = {
	stopbgm = true,
	mode = 1
}
slot2.typewriter = {
	speed = 0.05,
	speedUp = 0.01
}
slot2.painting = {
	alpha = 0.3,
	time = 1
}
slot1[2] = {
	side = 2,
	bgName = "bg_story_school",
	dir = 1,
	bgm = "story-1",
	actor = 101170,
	nameColor = "#a9f548",
	say = "听说Z23在这里……"
}
slot2.paintingFadeOut = {
	time = 0.5,
	side = 0
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
	say = "特别辅导什么的，好像很好玩的样子～",
	side = 1,
	bgName = "bg_story_school",
	dir = 1,
	actor = 201210,
	nameColor = "#a9f548"
}
slot2.typewriter = {
	speed = 0.05,
	speedUp = 0.01
}
slot2.painting = {
	alpha = 0.3,
	time = 1
}
slot1[4] = {
	actor = 301050,
	side = 2,
	bgName = "bg_story_school",
	nameColor = "#a9f548",
	dir = 1,
	say = "{namecode:6}…也想当一回Z23的学生"
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
	actor = 401230,
	side = 2,
	bgName = "bg_story_school",
	nameColor = "#a9f548",
	dir = 1,
	say = "你、你们是来逗我玩的吧！"
}
slot4.pos = {
	x = 1125
}
slot3[1] = {
	actor = 201210
}
slot4.pos = {
	x = 600
}
slot3[2] = {
	actor = 301050
}
slot2.subActors = {}
slot2.painting = {
	alpha = 0.3,
	time = 1
}
slot2.typewriter = {
	speed = 0.05,
	speedUp = 0.01
}
slot1[6] = {
	actorShadow = true,
	side = 0,
	bgName = "bg_story_school",
	actor = 101170,
	actorName = "拉菲&标枪&{namecode:6}",
	hideOther = true,
	nameColor = "#a9f548",
	say = "「「「教教我吧，Z23老师！」」」"
}
slot2.typewriter = {
	speed = 0.05,
	speedUp = 0.01
}
slot2.painting = {
	alpha = 0.3,
	time = 1
}
slot1[7] = {
	actor = 401230,
	side = 2,
	bgName = "bg_story_school",
	nameColor = "#a9f548",
	dir = 1,
	say = "好、好吧，那我就勉为其难地——"
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
slot2.painting = {
	alpha = 0.3,
	time = 1
}
slot1[8] = {
	side = 2,
	bgName = "bg_story_school",
	dir = 1,
	actor = 401231,
	nameColor = "#a9f548",
	say = "这里是重点！（敲黑板）不乖乖记笔记的话，Z23老师就要惩罚你了哦！"
}
slot0.scripts = {}

return {
	fadeOut = 1.5,
	mode = 2,
	fadeType = 2,
	once = true,
	id = "TEACHER7",
	fadein = 1.5
}
