slot0.effect_list = {
	80042,
	80041
}
slot2.trigger = {
	"onUpdate"
}
slot2.arg_list = {
	buff_id = 8006,
	target = "TargetSelf"
}
slot1[1] = {
	type = "BattleBuffAddBuff"
}
slot2.trigger = {
	"onUpdate"
}
slot2.arg_list = {
	buff_id = 8003,
	target = "TargetSelf"
}
slot1[2] = {
	type = "BattleBuffAddBuff"
}
slot2.trigger = {
	"onUpdate"
}
slot2.arg_list = {
	count = 1
}
slot1[3] = {
	type = "BattleBuffCancelBuff"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "自爆船冲撞自杀buff",
	init_effect = "",
	picture = "",
	desc = "自爆船冲撞自杀buff",
	stack = 1,
	id = 8002,
	icon = 8002,
	last_effect = ""
}
