slot2.trigger = {
	"onHPRatioUpdate"
}
slot2.arg_list = {
	buff_id = 19252,
	quota = 2,
	time = 10,
	hpUpperBound = 0.5,
	target = "TargetSelf"
}
slot1[1] = {
	type = "BattleBuffAddBuff"
}
slot2.trigger = {
	"onHPRatioUpdate"
}
slot2.arg_list = {
	quota = 2,
	target = "TargetSelf",
	time = 10,
	hpUpperBound = 0.5,
	skill_id = 19250
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
	name = "加斯科涅高血量小回复",
	init_effect = "",
	id = 19250,
	time = 0,
	picture = "",
	desc = "",
	stack = 1,
	color = "blue",
	icon = 19250,
	last_effect = ""
}
