slot2.trigger = {
	"onUpdate"
}
slot2.arg_list = {
	buff_id = 5043,
	target = "TargetSelf",
	time = 20
}
slot1[1] = {
	type = "BattleBuffAddBuff"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "照明弹",
	init_effect = "",
	id = 5042,
	picture = "",
	desc = "每隔20秒，有機率使用照明弹",
	stack = 1,
	color = "yellow",
	icon = 5040,
	last_effect = ""
}
