slot2.trigger = {
	"onAttach",
	"onRemove"
}
slot2.arg_list = {
	check_target = "TargetAllHarm",
	checkTargetMaxDistance = 300
}
slot1[1] = {
	type = "BattleBuffStun"
}
slot2.trigger = {
	"onRemove"
}
slot2.arg_list = {
	buff_id = 12585
}
slot1[2] = {
	type = "BattleBuffAddBuff"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "定身",
	init_effect = "",
	picture = "",
	desc = "",
	stack = 1,
	id = 12854,
	icon = 12854,
	last_effect = "Darkness"
}
