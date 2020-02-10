slot2.trigger = {
	"onShieldBroken"
}
slot2.arg_list = {
	countTarget = 3,
	countType = 8026
}
slot1[1] = {
	type = "BattleBuffCount"
}
slot2.trigger = {
	"onBattleBuffCount"
}
slot2.arg_list = {
	buff_id = 8026,
	rant = 10000,
	target = "TargetSelf",
	countType = 8026
}
slot1[2] = {
	type = "BattleBuffAddBuff"
}
slot0.effect_list = {}

return {
	time = 99999,
	name = "第4章重巡使用盾buff",
	init_effect = "",
	picture = "",
	desc = "第4章重巡使用盾buff",
	stack = 1,
	id = 8025,
	icon = 8025,
	last_effect = ""
}
