slot2.trigger = {
	"onHPRatioUpdate"
}
slot2.arg_list = {
	hpUpperBound = 0.45,
	skill_id = 4,
	target = "TargetSelf"
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {
	"onHPRatioUpdate"
}
slot2.arg_list = {
	hpUpperBound = 0.45,
	buff_id = 5,
	target = "TargetSelf"
}
slot1[2] = {
	type = "BattleBuffAddBuff"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "损害管制",
	init_effect = "",
	picture = "",
	desc = "耐久低于40%时，回复所有耐久",
	stack = 1,
	id = 4,
	icon = 4,
	last_effect = "Health"
}
