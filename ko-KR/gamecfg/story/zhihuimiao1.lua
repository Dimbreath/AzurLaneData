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
	nameColor = "#92fc63",
	say = "냐냥! 멋대로 뛰어다니면 안 된다냥!"
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
	nameColor = "#92fc63",
	dir = 1,
	say = "헉헉…우냥? 지휘관, 돌아온거냥!? 마침 잘 됐다냥! 이 아이 잡는 것 좀 도와줘냥!"
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
	nameColor = "#92fc63",
	say = "지휘관 덕분에 살았다냥…"
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
	nameColor = "#92fc63",
	dir = 1,
	say = "이게 뭔지 궁금하구냥?? 후후후, 좋은 질문이다냥! 이 아이는 아카시와 모항의 과학부에 의한 노력의 결정체다냥!"
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
	say = "이름하여, ‘지휘냥’ 이다냥!",
	side = 2,
	bgName = "bg_story_task",
	dir = 1,
	actor = 312010,
	nameColor = "#92fc63",
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
	nameColor = "#92fc63",
	say = "아카시가 소개해 주겠다냥!"
}
slot0.scripts = {}

return {
	mode = 2,
	once = true,
	id = "ZHIHUIMIAO1",
	fadein = 1.5
}
