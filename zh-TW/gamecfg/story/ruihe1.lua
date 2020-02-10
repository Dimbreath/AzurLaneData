slot3[1] = {
	"幸運之鶴\n\n<size=45>一  {namecode:96}的早晨</size>",
	1
}
slot2.sequence = {}
slot1[1] = {
	mode = 1,
	stopbgm = true
}
slot2.typewriter = {
	speed = 0.05,
	speedUp = 0.01
}
slot1[2] = {
	say = "往常的這個時間，作為秘書艦的{namecode:96}應該已經前來進行早晨的報告了。不過今天…似乎還沒來的樣子",
	side = 2,
	bgName = "bg_story_task",
	dir = 1,
	bgm = "story-1"
}
slot2.typewriter = {
	speed = 0.05,
	speedUp = 0.01
}
slot3[1] = {
	content = "去重櫻航母宿舍看看",
	flag = 1
}
slot2.options = {}
slot1[3] = {
	withoutPainting = true,
	side = 2,
	bgName = "bg_story_task",
	dir = 1,
	actor = 0,
	nameColor = "#a9f548",
	say = "……"
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
slot1[4] = {
	withoutPainting = true,
	side = 2,
	bgName = "bg_story_room",
	dir = 1,
	actorName = "{namecode:96}",
	actor = 307060,
	nameColor = "#a9f548",
	say = "呼…哈啊…咕…Zzzzzzz"
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
	nameColor = "#a9f548",
	side = 2,
	bgName = "bg_story_room",
	dir = 1,
	actor = 307050,
	actorName = "{namecode:95}",
	say = "如您所見…指揮官，非常抱歉……"
}
slot2.typewriter = {
	speed = 0.05,
	speedUp = 0.01
}
slot1[6] = {
	side = 2,
	bgName = "bg_story_room",
	dir = 1,
	say = "{namecode:96}在床上躺成大字，發出豪爽的酣睡聲"
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
	nameColor = "#a9f548",
	side = 2,
	bgName = "bg_story_room",
	dir = 1,
	actor = 307050,
	actorName = "{namecode:95}",
	say = "不知道是不是昨晚特訓太拼命了…明明平常都比我早起得多"
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
	nameColor = "#a9f548",
	side = 2,
	bgName = "bg_story_room",
	dir = 1,
	actor = 307050,
	actorName = "{namecode:95}",
	say = "好啦{namecode:96}，快起床，指揮官來了哦？"
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
slot3[1] = {
	y = 0,
	type = "shake",
	dur = 1.2,
	x = 30,
	number = 1
}
slot3[2] = {
	y = 30,
	type = "shake",
	delay = 2,
	dur = 0.1,
	number = 3
}
slot2.action = {}
slot1[9] = {
	say = "指……啊嗚！？對對對不起我睡過頭…哇啊啊啊！？",
	side = 0,
	bgName = "bg_story_room",
	actorName = "{namecode:96}",
	dir = 1,
	actor = 307060,
	nameColor = "#a9f548"
}
slot2.typewriter = {
	speed = 0.05,
	speedUp = 0.01
}
slot1[10] = {
	side = 2,
	bgName = "bg_story_room",
	dir = 1,
	say = "慌忙起身的{namecode:96}踩到了掉在地上的被子摔倒了"
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
	nameColor = "#a9f548",
	side = 2,
	bgName = "bg_story_room",
	dir = 1,
	actor = 307050,
	actorName = "{namecode:95}",
	say = "哎呀呀……姐姐幫你整理，快去洗漱一下吧"
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
	nameColor = "#a9f548",
	side = 2,
	bgName = "bg_story_room",
	dir = 1,
	actor = 307050,
	actorName = "{namecode:95}",
	say = "…指揮官在等著你哦？呵呵"
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
slot1[13] = {
	say = "好、好的！",
	side = 0,
	bgName = "bg_story_room",
	actorName = "{namecode:96}",
	dir = 1,
	blackBg = true,
	actor = 307060,
	nameColor = "#a9f548"
}
slot0.scripts = {}

return {
	fadeOut = 1.5,
	mode = 2,
	fadeType = 2,
	once = true,
	id = "RUIHE1",
	fadein = 1.5
}
