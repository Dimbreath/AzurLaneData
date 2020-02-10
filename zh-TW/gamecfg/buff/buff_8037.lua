slot2.trigger = {
	"onShieldBroken"
}
slot2.arg_list = {
	countTarget = 3,
	countType = 8038
}
slot1[1] = {
	type = "BattleBuffCount"
}
slot2.trigger = {
	"onBattleBuffCount"
}
slot2.arg_list = {
	buff_id = 8038,
	rant = 10000,
	target = "TargetSelf",
	countType = 8038
}
slot1[2] = {
	type = "BattleBuffAddBuff"
}
slot0.effect_list = {}

return {
	time = 99999,
	name = "第6章重巡使用盾buff",
	init_effect = "",
	picture = "",
	desc = "第6章重巡使用盾buff",
	stack = 1,
	id = 8037,
	icon = 8037,
	last_effect = ""
}
