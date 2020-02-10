slot3[1] = {
	"お花見大会\n\n<size=45>その六  花見で一杯</size>",
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
	actor = 305030,
	nameColor = "#a9f548",
	say = "…ぷはぁ～やっぱりお花見にはこれがないとな～"
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
	say = "姉さんの飲みっぷりは相変わらず豪快ね…じゃあ私も――",
	side = 1,
	bgName = "bg_story_school",
	dir = 1,
	actor = 305040,
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
	actor = 301300,
	nameColor = "#a9f548",
	bgName = "bg_story_school",
	side = 2,
	dir = -1,
	say = "おーほっほっほ！「花見酒」とは風流よのう！"
}
slot2.paintingFadeOut = {
	time = 0.5,
	side = 1
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
	say = "重桜の風習ね…悪くないわ。",
	side = 0,
	bgName = "bg_story_school",
	dir = 1,
	actor = 403030,
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
slot1[6] = {
	actor = 403030,
	nameColor = "#a9f548",
	bgName = "bg_story_school",
	side = 0,
	dir = 1,
	say = "風に舞うサクラの下で酒を飲むなんて、意外と風情があるものね。"
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
	actor = 101170,
	nameColor = "#a9f548",
	bgName = "bg_story_school",
	side = 1,
	dir = 1,
	say = "重桜のお酒、美味しい…けぷー"
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
	bgName = "bg_story_school",
	side = 2,
	dir = 1,
	actor = 306030,
	nameColor = "#a9f548",
	say = "あら？あちらも騒がしいですね……"
}
slot2.typewriter = {
	speed = 0.05,
	speedUp = 0.01
}
slot2.painting = {
	alpha = 0.3,
	time = 1
}
slot1[9] = {
	actor = 306030,
	nameColor = "#a9f548",
	bgName = "bg_story_school",
	side = 2,
	dir = 1,
	say = "これは…あとでまた「ジゴク」が見れそうな飲みっぷりですわ～うふふ"
}
slot0.scripts = {}

return {
	fadeOut = 1.5,
	mode = 2,
	fadeType = 2,
	once = true,
	id = "SHANGYING6",
	fadein = 1.5
}
