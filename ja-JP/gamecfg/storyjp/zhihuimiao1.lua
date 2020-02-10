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
	say = "にゃにゃ！勝手に走っちゃダメだにゃ！"
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
	say = "はあはあ…うにゃ？指揮官が戻ったかにゃ！？ちょうどいいにゃ！この子を捕まえるのを手伝ってにゃ！"
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
	say = "指揮官、助かったにゃ……"
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
	say = "これは何にゃって？？ふふふ、よく聞いてくれたにゃ！この子は明石と母港の科学部による、努力の結晶にゃ！"
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
	say = "名付けて、「オフニャ」、だにゃ！",
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
	say = "明石が紹介してあげるにゃ！"
}
slot0.scripts = {}

return {
	fadeOut = 1.5,
	mode = 2,
	fadeType = 2,
	once = true,
	id = "ZHIHUIMIAO1",
	fadein = 1.5
}
