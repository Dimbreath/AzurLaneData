slot3[1] = {
	"<size=51>「現れたすべての敵を破壊すれば、平穏が戻ってくると思っていた」</size>",
	2.5
}
slot3[2] = {
	"<size=51>「だが世界の『未来』は…私たちを裏切った」</size>",
	5
}
slot3[3] = {
	"<size=51>「翼が折れ、砲身が熔け、我が身となる鋼が軋んでも、戦いは終わらない」</size>",
	7
}
slot3[4] = {
	"<size=51>「次々と消えていく前に立ってくれた仲間たち……その顔すら忘れてしまった」</size> ",
	10
}
slot3[5] = {
	"<size=51>「――出撃、か」</size>",
	12.5
}
slot3[6] = {
	" ",
	13
}
slot3[7] = {
	"<size=51>「……今夜の空も綺麗だ」</size>",
	15
}
slot3[8] = {
	"<size=51>——闇に堕ちた青き翼</size>",
	20
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
slot1[2] = {
	say = "ここが「謎の信号」が示した海域……どうやら私たちは遅かったみたい",
	actorName = "ヘレナ",
	bgName = "bg_story_wing1",
	side = 0,
	dir = 1,
	nameColor = "#a9f548",
	bgm = "story-6"
}
slot2.typewriter = {
	speed = 0.05,
	speedUp = 0.01
}
slot1[3] = {
	actorName = "ノースカロライナ",
	side = 0,
	bgName = "bg_story_wing1",
	nameColor = "#a9f548",
	dir = 1,
	say = "ひどい有様ね。完全に廃墟と化してしまっているわ"
}
slot2.typewriter = {
	speed = 0.05,
	speedUp = 0.01
}
slot1[4] = {
	actorName = "ヘレナ",
	side = 0,
	bgName = "bg_story_wing1",
	nameColor = "#a9f548",
	dir = 1,
	say = "セイレーンの実験場「鏡面海域」をここまで破壊できるなんて……一体誰が……"
}
slot2.typewriter = {
	speed = 0.05,
	speedUp = 0.01
}
slot1[5] = {
	actorName = "ワシントン",
	side = 0,
	bgName = "bg_story_wing1",
	nameColor = "#a9f548",
	dir = 1,
	say = "例の重桜の「新生連合艦隊」とやらの仕業か？"
}
slot2.typewriter = {
	speed = 0.05,
	speedUp = 0.01
}
slot1[6] = {
	actorName = "ノースカロライナ",
	side = 0,
	bgName = "bg_story_wing2",
	nameColor = "#a9f548",
	dir = 1,
	say = "違うわ。この痕跡は重桜やロイヤルの兵装というよりも、どちらかというと私たちユニオンの兵装のものよ"
}
slot2.typewriter = {
	speed = 0.05,
	speedUp = 0.01
}
slot1[7] = {
	actorName = "ワシントン",
	side = 0,
	bgName = "bg_story_wing2",
	nameColor = "#a9f548",
	dir = 1,
	say = "あああ！なにがどうなってんだよ！"
}
slot2.typewriter = {
	speed = 0.05,
	speedUp = 0.01
}
slot1[8] = {
	actorName = "ワシントン",
	side = 0,
	bgName = "bg_story_wing2",
	nameColor = "#a9f548",
	dir = 1,
	say = "…ま、少なくとも敵を叩く手間を省いてくれた！そいつに出会ったらお礼でもしてやろうじゃない"
}
slot2.typewriter = {
	speed = 0.05,
	speedUp = 0.01
}
slot1[9] = {
	actorName = "ワシントン",
	side = 0,
	bgName = "bg_story_wing2",
	nameColor = "#a9f548",
	dir = 1,
	say = "とりあえずこのあたりから調べて、情報を集めとくか"
}
slot0.scripts = {}

return {
	fadeOut = 0.5,
	mode = 2,
	fadeType = 1,
	once = true,
	id = "DONGHUO01",
	occlusion = 2
}
