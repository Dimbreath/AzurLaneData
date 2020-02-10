slot2.trigger = {
	"onAttach",
	"onUpdate",
	"onRemove"
}
slot2.arg_list = {
	check_target = "TargetAllHarm",
	checkTargetMaxDistance = 100
}
slot1[1] = {
	type = "BattleBuffStun"
}
slot0.effect_list = {}

return {
	time = 1,
	name = "自爆船冲撞自杀buff停止",
	init_effect = "gantanhao",
	picture = "",
	desc = "自爆船冲撞自杀buff停止",
	stack = 1,
	id = 8006,
	icon = 8006,
	last_effect = ""
}
