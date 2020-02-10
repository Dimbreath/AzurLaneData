slot2.trigger = {
	"onHPRatioUpdate"
}
slot2.arg_list = {
	hpUpperBound = 0.2,
	skill_id = 10190,
	target = "TargetSelf",
	quota = 1
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {
	"onTakeDamage"
}
slot2.arg_list = {
	quota = 1,
	skill_id = 10191,
	target = "TargetSelf"
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
	name = "复仇打击",
	init_effect = "",
	id = 10190,
	time = 0,
	picture = "",
	desc = "",
	stack = 1,
	color = "blue",
	icon = 10190,
	last_effect = "Health"
}
