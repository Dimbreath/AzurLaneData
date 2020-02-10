slot3[1] = {
	"<size=51>「墜落か、上昇か」</size>",
	1
}
slot3[2] = {
	"<size=51>「その悩みは純潔、その躊躇いは純真、その選択は純白な神聖」</size>",
	3
}
slot3[3] = {
	"<size=51>「獣に追われ、森に沈んでゆく者」</size>",
	5
}
slot3[4] = {
	"<size=51>「獣を追い払い、頂上へと登り続ける者」</size> ",
	7
}
slot3[5] = {
	"<size=51>「あなたにコキュートスの永遠の安寧あり」</size>",
	9
}
slot2.sequence = {}
slot1[1] = {
	stopbgm = true,
	mode = 1
}
slot3[1] = {
	"<size=51>「あなたにエンピリオの永遠の栄光あり」</size>",
	1
}
slot3[2] = {
	"<size=51>「心満たされし彷徨を選び、十天への道筋を断とう」</size>",
	3
}
slot3[3] = {
	"<size=51>「心満たされし漂白を選び、人の世の黄金を捨てよう」</size>",
	5
}
slot3[4] = {
	"<size=51>「差し伸べられた手を握りしめるのは、貴方」</size>",
	7
}
slot3[5] = {
	"<size=51>「さあ、物語の結末を聞かせて頂戴？」</size>",
	9
}
slot2.sequence = {}
slot1[2] = {
	stopbgm = true,
	mode = 1
}
slot3.alpha = {
	0,
	1
}
slot2.flashout = {
	dur = 0.5,
	black = true
}
slot3.alpha = {
	1,
	0
}
slot2.flashin = {
	delay = 0.5,
	dur = 0.5,
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
slot1[3] = {
	expression = 2,
	side = 2,
	dir = 1,
	bgmDelay = 1,
	bgName = "bg_italy_cg6",
	bgm = "story-italy",
	actor = 900198,
	nameColor = "#ff5c5c",
	say = "確かに、来ていませんよね？"
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
	expression = 6,
	side = 2,
	bgName = "bg_italy_cg6",
	dir = 1,
	actor = 605020,
	nameColor = "#ff5c5c",
	say = "ああ、ロイヤルネイビーと接触したときから鉄血には支援を要請したが、一向に現れなかった"
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
	actor = 605020,
	side = 2,
	bgName = "bg_italy_cg6",
	nameColor = "#ff5c5c",
	dir = 1,
	say = "夜での戦闘は不確定要素が多いというのが応じない理由らしいが、まあただの言い訳よ"
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
	actor = 900198,
	side = 2,
	bgName = "bg_italy_cg6",
	nameColor = "#ff5c5c",
	dir = 1,
	say = "ええ…………"
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
	actor = 900198,
	side = 2,
	bgName = "bg_italy_cg6",
	nameColor = "#ff5c5c",
	dir = 1,
	say = "ヴィシアと同じ、私たちは四大陣営から見て取るに足らない存在"
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
	expression = 2,
	side = 2,
	bgName = "bg_italy_cg6",
	dir = 1,
	actor = 900198,
	nameColor = "#ff5c5c",
	say = "レッドアクシズに誘われたときにはあんなに希望を持てたというのに…"
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
	actor = 900198,
	side = 2,
	bgName = "bg_italy_cg6",
	nameColor = "#ff5c5c",
	dir = 1,
	say = "これはまた「再現」のために見捨てられた、と考えたほうがいいですね"
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
	expression = 4,
	side = 2,
	bgName = "bg_italy_cg6",
	dir = 1,
	actor = 605020,
	nameColor = "#ff5c5c",
	say = "そろそろ終幕の時間ね。ヴェネト"
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
	actor = 900198,
	side = 2,
	bgName = "bg_italy_cg6",
	nameColor = "#ff5c5c",
	dir = 1,
	say = "ええ、この「再現」の「演目」はそろそろ終わり。私たちにできるのは、悲劇か喜劇を選ぶことしかありませんから――"
}
slot0.scripts = {}

return {
	fadeOut = 1.5,
	mode = 2,
	fadeType = 1,
	once = true,
	id = "SHENSHENGDEBEIXIJU19",
	fadein = 1.5
}
