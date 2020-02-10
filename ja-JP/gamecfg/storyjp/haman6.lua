slot3[1] = {
	"ハムマン観察記録\n\n<size=45>その六 もしもし海軍部！？</size>",
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
	say = "ええと、たまたまーに指揮官と出会っちゃってハムマンはどうしたのかな～って話になってその…ええと…",
	dir = 1,
	bgm = "story-1"
}
slot2.typewriter = {
	speed = 0.05,
	speedUp = 0.01
}
slot3[1] = {
	content = "ごめんなさい！盗み聞きする気はなかった！",
	flag = 1
}
slot3[2] = {
	content = "シムスに唆されたんだ！",
	flag = 2
}
slot2.options = {}
slot1[3] = {
	actor = 107050,
	side = 2,
	bgName = "bg_story_room",
	dir = 1,
	say = "そう…？さっきまでそこでずっと聞いてた気が……"
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
	say = "そうそう！ただの偶然だよ！ぐーぜん！"
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
	say = "ええええ！！？？"
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
	say = "し、しき、指揮官！？"
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
	say = "このヘンタイ！！ストーカー！！大バカああああ！！"
}
slot2.typewriter = {
	speed = 0.05,
	speedUp = 0.01
}
slot1[8] = {
	side = 2,
	bgName = "bg_story_room",
	dir = 1,
	say = "ハムマンが涙目ながら海軍部へ電話をかけようとどこからか黒電話を取り出す。"
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
	say = "も、もしもし海軍部！！そうです！ここにいる指揮官が…指揮官が…が……"
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
	content = "ごめんなさい、本当は出てくるタイミングを逃してしまっていたんだ。",
	flag = 1
}
slot2.options = {}
slot1[10] = {
	actor = 101250,
	side = 2,
	bgName = "bg_story_room",
	dir = 1,
	say = "な、なにもありませんでした…はい……"
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
	say = "…ほら、指揮官様はハムマンが心配だから探しに来たでしょ？",
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
	say = "分かってる…わかってるけど……"
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
	say = "指揮官様、ごめんなさい…ハムマンちゃんがいつもご迷惑を…"
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
	say = "ハムマンも素直に言えばいいのに～"
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
	say = "……うぅ……"
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
