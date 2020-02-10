slot3[1] = {
	"여름의 전골 대회?!\n\n<size=45>제5장 - 숨겨진 맛은…!</size>",
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
	bgName = "bg_story_room",
	dir = 1,
	bgmDelay = 2,
	bgm = "story-1",
	say = "그리고…"
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
	withoutPainting = true,
	side = 2,
	bgName = "bg_story_room",
	nameColor = "#92fc63",
	dir = 1,
	actor = 0,
	actorName = "모두",
	say = "……"
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
	nameColor = "#92fc63",
	side = 2,
	bgName = "bg_story_room",
	dir = 1,
	actor = 301320,
	actorName = "{namecode:33}",
	say = "다들 안 보고 있을 때, 사탕을……"
}
slot2.typewriter = {
	speed = 0.05,
	speedUp = 0.01
}
slot2.painting = {
	alpha = 0.3,
	time = 1
}
slot3[1] = {
	y = 15,
	type = "shake",
	delay = 0,
	dur = 0.1,
	x = 0,
	number = 1
}
slot2.action = {}
slot1[5] = {
	nameColor = "#92fc63",
	side = 2,
	bgName = "bg_story_room",
	dir = 1,
	actor = 301320,
	actorName = "{namecode:33}",
	say = "응?"
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
	withoutPainting = true,
	side = 2,
	bgName = "bg_story_room",
	nameColor = "#92fc63",
	dir = 1,
	actor = 0,
	actorName = "모두",
	say = "(찌릿…)"
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
	nameColor = "#92fc63",
	side = 2,
	bgName = "bg_story_room",
	dir = -1,
	actor = 312010,
	actorName = "{namecode:98}",
	say = "무츠키, 언제부터 있었냥?!"
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
slot1[8] = {
	say = "전골에 사탕을 넣어서는 안 된답니다……",
	side = 1,
	bgName = "bg_story_room",
	nameColor = "#92fc63",
	dir = 1,
	actor = 301180,
	actorName = "{namecode:20}"
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
	nameColor = "#92fc63",
	side = 2,
	bgName = "bg_story_room",
	dir = 1,
	actor = 301330,
	actorName = "{namecode:34}",
	say = "무, 무츠키?! 겨울옷 입으라며…?"
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
slot1[10] = {
	say = "응? 아…까, 깜빡했다!",
	side = 0,
	bgName = "bg_story_room",
	nameColor = "#92fc63",
	dir = 1,
	actor = 301320,
	actorName = "{namecode:33}"
}
slot2.typewriter = {
	speed = 0.05,
	speedUp = 0.01
}
slot2.painting = {
	alpha = 0.3,
	time = 1
}
slot1[11] = {
	nameColor = "#92fc63",
	side = 2,
	bgName = "bg_story_room",
	dir = 1,
	actor = 301170,
	actorName = "{namecode:19}",
	say = "어떻게 보아도 적당히 얼버무리려고 지어낸 얘기지 않느냐…"
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
slot1[12] = {
	say = "우으…무츠키를 믿었는데…무츠키 바아아보!!",
	side = 1,
	bgName = "bg_story_room",
	nameColor = "#92fc63",
	dir = 1,
	actor = 301330,
	actorName = "{namecode:34}"
}
slot2.typewriter = {
	speed = 0.05,
	speedUp = 0.01
}
slot2.painting = {
	alpha = 0.3,
	time = 1
}
slot1[13] = {
	nameColor = "#92fc63",
	side = 0,
	bgName = "bg_story_room",
	dir = 1,
	blackBg = true,
	actor = 301320,
	actorName = "{namecode:33}",
	say = "무츠키가 잘못했어……키사라기, 미안해!"
}
slot0.scripts = {}

return {
	fadeOut = 1.5,
	mode = 2,
	fadeType = 2,
	once = true,
	id = "ACTRUYUE05",
	fadein = 1.5
}
