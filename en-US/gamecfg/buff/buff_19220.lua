slot2.trigger = {
	"onUpdate"
}
slot2.arg_list = {
	minTargetNumber = 1,
	range = 85,
	check_target = "TargetHarmNearest",
	quota = 1,
	skill_id = 19223
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {
	"onHPRatioUpdate"
}
slot2.arg_list = {
	hpUpperBound = 1,
	quota = 1,
	skill_id = 19223
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
	name = "腓特烈弹幕技能",
	init_effect = "",
	id = 19220,
	time = 0,
	picture = "",
	desc = "",
	stack = 1,
	color = "red",
	icon = 19220,
	last_effect = ""
}
