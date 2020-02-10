slot3[1] = {
	"哈曼观察日志\n\n<size=45>六 喂喂是海军部吗！？</size>",
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
	actor = 101240,
	side = 2,
	bgName = "bg_story_room",
	say = "嗯…偶然碰到指挥官然后说起哈曼怎么了…然后就…",
	dir = 1,
	bgm = "story-1"
}
slot2.typewriter = {
	speed = 0.05,
	speedUp = 0.01
}
slot3[1] = {
	content = "对不起！不是有意偷听的！",
	flag = 1
}
slot3[2] = {
	content = "是西姆斯怂恿的！",
	flag = 2
}
slot2.options = {}
slot1[3] = {
	actor = 107050,
	side = 2,
	bgName = "bg_story_room",
	dir = 1,
	say = "这样吗…？总觉得你们刚才一直在听呢…"
}
slot2.typewriter = {
	speed = 0.05,
	speedUp = 0.01
}
slot3[1] = {
	y = 30,
	dur = 0.15,
	number = 3,
	type = "shake"
}
slot2.action = {}
slot1[4] = {
	actor = 101240,
	side = 2,
	bgName = "bg_story_room",
	dir = 1,
	optionFlag = 1,
	say = "没错没错！真的是偶然啊！偶然！"
}
slot2.typewriter = {
	speed = 0.05,
	speedUp = 0.01
}
slot3[1] = {
	y = 45,
	dur = 0.2,
	number = 1,
	type = "shake"
}
slot2.action = {}
slot1[5] = {
	actor = 101240,
	side = 2,
	bgName = "bg_story_room",
	dir = 1,
	optionFlag = 2,
	say = "诶！！？？"
}
slot2.typewriter = {
	speed = 0.05,
	speedUp = 0.01
}
slot1[6] = {
	actor = 101250,
	side = 2,
	bgName = "bg_story_room",
	dir = 1,
	say = "指，指挥，指挥官！？"
}
slot2.typewriter = {
	speed = 0.05,
	speedUp = 0.01
}
slot3[1] = {
	y = 45,
	dur = 0.15,
	number = 3,
	type = "shake"
}
slot2.action = {}
slot1[7] = {
	actor = 101250,
	side = 2,
	bgName = "bg_story_room",
	dir = 1,
	say = "这个变态！！跟踪狂！！大笨蛋！！！"
}
slot2.typewriter = {
	speed = 0.05,
	speedUp = 0.01
}
slot1[8] = {
	side = 2,
	bgName = "bg_story_room",
	dir = 1,
	say = "哈曼泪目着摸出拨盘电话要打给海军部。"
}
slot2.typewriter = {
	speed = 0.05,
	speedUp = 0.01
}
slot1[9] = {
	actor = 101250,
	side = 2,
	bgName = "bg_story_room",
	dir = 1,
	say = "喂，是海军部吗！！是的！这里有个指挥官…指挥官…他……"
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
	content = "抱歉，真的只是错过了出面的时机。",
	flag = 1
}
slot2.options = {}
slot1[10] = {
	actor = 101250,
	side = 2,
	bgName = "bg_story_room",
	dir = 1,
	say = "没，什么事也没有…嗯……"
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
slot1[11] = {
	actor = 107050,
	side = 0,
	bgName = "bg_story_room",
	say = "…你看，指挥官这不是因为担心哈曼才找过来的吗？",
	dir = 1
}
slot2.typewriter = {
	speed = 0.05,
	speedUp = 0.01
}
slot1[12] = {
	actor = 101250,
	side = 1,
	bgName = "bg_story_room",
	dir = 1,
	say = "我知道啦…虽然知道不过…"
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
	actor = 107050,
	side = 0,
	bgName = "bg_story_room",
	dir = 1,
	say = "指挥官，真是对不起…哈曼总是给你添麻烦…"
}
slot2.typewriter = {
	speed = 0.05,
	speedUp = 0.01
}
slot2.painting = {
	alpha = 0.3,
	time = 1
}
slot1[14] = {
	actor = 101240,
	side = 0,
	bgName = "bg_story_room",
	dir = 1,
	say = "哈曼也老实承认不就好了嘛～"
}
slot3[1] = {
	y = 0,
	type = "shake",
	dur = 0.3,
	x = 30,
	number = 3
}
slot2.action = {}
slot2.typewriter = {
	speed = 0.05,
	speedUp = 0.01
}
slot2.painting = {
	alpha = 0.3,
	time = 1
}
slot1[15] = {
	bgName = "bg_story_room",
	side = 2,
	actor = 101250,
	dir = 1,
	blackBg = true,
	hideOther = true,
	say = "……呜呜……"
}
slot0.scripts = {}

return {
	fadeOut = 1.5,
	mode = 2,
	fadeType = 2,
	once = true,
	id = "HAMAN6",
	fadein = 1.5
}
