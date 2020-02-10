slot2.trigger = {
	"onShieldBroken"
}
slot2.arg_list = {
	countTarget = 3,
	countType = 8017
}
slot1[1] = {
	type = "BattleBuffCount"
}
slot2.trigger = {
	"onBattleBuffCount"
}
slot2.arg_list = {
	buff_id = 8017,
	rant = 10000,
	target = "TargetSelf",
	countType = 8017
}
slot1[2] = {
	type = "BattleBuffAddBuff"
}
slot0.effect_list = {}

return {
	time = 99999,
	name = "第1章重巡使用盾buff",
	init_effect = "",
	picture = "",
	desc = "第1章重巡使用盾buff",
	stack = 1,
	id = 8016,
	icon = 8016,
	last_effect = ""
}
