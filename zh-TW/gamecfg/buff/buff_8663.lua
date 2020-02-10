slot2.trigger = {
	"onAttach"
}
slot2.arg_list = {
	hpUpperBound = 0.9,
	skill_id = 8663,
	target = "TargetSelf",
	quota = 1
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {
	"onAttach"
}
slot2.arg_list = {
	quota = 1,
	skill_id = 8664,
	hpUpperBound = 1,
	target = "TargetSelf",
	hpLowerBound = 0.9
}
slot1[2] = {
	type = "BattleBuffCastSkill"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "黛朵",
	init_effect = "",
	id = 8663,
	picture = "",
	desc = "",
	stack = 1,
	color = "yellow",
	icon = 8663,
	last_effect = ""
}
