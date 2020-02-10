slot2.trigger = {
	"onFoeDying"
}
slot2.arg_list = {
	quota = 8,
	killer = "self",
	target = "TargetSelf",
	skill_id = 12444
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {
	"onBattleBuffCount"
}
slot2.arg_list = {
	count = 1,
	countType = 12440
}
slot1[2] = {
	type = "BattleBuffCancelBuff"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "",
	init_effect = "",
	id = 12443,
	picture = "",
	desc = "触发器",
	stack = 1,
	color = "red",
	icon = 12440,
	last_effect = ""
}
