slot2.trigger = {
	"onStartGame"
}
slot2.arg_list = {
	target = "TargetSelf",
	skill_id = 18041
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {
	"onStartGame",
	"onHPRatioUpdate"
}
slot2.arg_list = {
	hpUpperBound = 0.2,
	target = "TargetSelf",
	skill_id = 18040,
	quota = 1
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
	name = "底力爆发 +",
	init_effect = "",
	id = 18040,
	time = 0,
	picture = "",
	desc = "",
	stack = 1,
	color = "blue",
	icon = 18040,
	last_effect = ""
}
