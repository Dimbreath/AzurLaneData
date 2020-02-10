slot2.trigger = {
	"onAttach",
	"onStack"
}
slot3.check_target = {
	"TargetSelf",
	"TargetShipArmor"
}
slot2.arg_list = {
	buff_id = 401,
	armor_type = 3,
	minTargetNumber = 1,
	target = "TargetSelf"
}
slot1[1] = {
	type = "BattleBuffAddBuff"
}
slot0.effect_list = {}

return {
	time = 1,
	name = "穿甲对重甲破甲",
	init_effect = "",
	picture = "",
	desc = "",
	stack = 1,
	id = 400,
	icon = 400,
	last_effect = ""
}
