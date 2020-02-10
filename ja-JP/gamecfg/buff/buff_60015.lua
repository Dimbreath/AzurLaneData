slot2.trigger = {
	"onAttach",
	"onRemove"
}
slot2.arg_list = {
	group = 60015,
	number = 0.5,
	attr = "injureRatio"
}
slot1[1] = {
	type = "BattleBuffAddAttr"
}
slot2.trigger = {
	"onAttach",
	"onRemove"
}
slot2.arg_list = {
	group = 60015,
	number = 0.333,
	attr = "injureRatioByShipID_109"
}
slot1[2] = {
	type = "BattleBuffAddAttr"
}
slot2.trigger = {
	"onBeHit"
}
slot2.arg_list = {
	count = 1
}
slot1[3] = {
	type = "BattleBuffCancelBuff"
}
slot0.effect_list = {}

return {
	time = 10,
	name = "测试-海伦娜-标记",
	init_effect = "Darkness",
	picture = "",
	desc = "舰队之眼-标记",
	stack = 1,
	id = 60015,
	icon = 60015,
	last_effect = ""
}
