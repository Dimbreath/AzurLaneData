slot3[1] = {
	"Class Z VII\n\n<size=45>Teach Me, Miss Z23! </size>",
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
	say = "I heard Zed was here..."
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
	say = "What's \"special tutoring?\" Sounds like something that would be fun with the Commander~",
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
	say = "Ayanami... also wants to be Z23's student..."
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
	say = "Y-you've come to tease me, haven't you?!"
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
	actorName = "Laffey&Javelin&{namecode:6}",
	hideOther = true,
	nameColor = "#a9f548",
	say = "\"Teach me, Miss Z23!!\""
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
	say = "All right, all right. There's no point being shy now..."
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
	say = "This is important! (knocks on the blackboard) If you don't take notes carefully, Miss Z23 is going to punish you!"
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
