slot2.trigger = {
	"onStartGame"
}
slot2.arg_list = {
	buff_id = 12421,
	target = "TargetSelf"
}
slot1[1] = {
	type = "BattleBuffAddBuff"
}
slot2.trigger = {
	"onFoeDying"
}
slot2.arg_list = {
	quota = 8,
	killer = "self",
	target = "TargetSelf",
	skill_id = 12421
}
slot1[2] = {
	type = "BattleBuffCastSkill"
}
slot0.effect_list = {}
slot0[1] = {}
slot0[2] = {}
slot0[3] = {}
slot0[4] = {}
slot0[5] = {}
slot0[6] = {}
slot0[7] = {}
slot0[8] = {}
slot0[9] = {}
slot0[10] = {}

return {
	desc_get = "",
	name = "伦敦改",
	init_effect = "",
	id = 12420,
	time = 0,
	picture = "",
	desc = "",
	stack = 1,
	color = "red",
	icon = 12420,
	last_effect = ""
}
