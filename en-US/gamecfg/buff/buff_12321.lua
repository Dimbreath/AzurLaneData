slot2.trigger = {
	"onAttach",
	"onStack"
}
slot2.arg_list = {
	countTarget = 10,
	countType = 12340
}
slot1[1] = {
	type = "BattleBuffCount"
}
slot2.trigger = {
	"onBattleBuffCount"
}
slot2.arg_list = {
	buff_id = 12322,
	target = "TargetSelf",
	countType = 12340
}
slot1[2] = {
	type = "BattleBuffAddBuff"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "恶毒",
	init_effect = "",
	picture = "",
	desc = "",
	stack = 1,
	id = 12321,
	icon = 12321,
	last_effect = ""
}
