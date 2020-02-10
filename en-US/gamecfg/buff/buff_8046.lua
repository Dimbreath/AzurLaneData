slot2.trigger = {
	"onShieldBroken"
}
slot2.arg_list = {
	countTarget = 3,
	countType = 8047
}
slot1[1] = {
	type = "BattleBuffCount"
}
slot2.trigger = {
	"onBattleBuffCount"
}
slot2.arg_list = {
	buff_id = 8047,
	rant = 10000,
	target = "TargetSelf",
	countType = 8047
}
slot1[2] = {
	type = "BattleBuffAddBuff"
}
slot0.effect_list = {}

return {
	time = 99999,
	name = "第10章重巡使用盾buff",
	init_effect = "",
	picture = "",
	desc = "第10章重巡使用盾buff",
	stack = 1,
	id = 8046,
	icon = 8046,
	last_effect = ""
}
