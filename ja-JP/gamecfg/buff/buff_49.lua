slot1[1] = SYSTEM_SCENARIO
slot1[2] = SYSTEM_ROUTINE
slot1[3] = SYSTEM_DUEL
slot0.limit = {}
slot2.trigger = {
	"onAttach"
}
slot2.arg_list = {
	number = -0.2,
	target = "TargetSelf",
	attr = "injureRatio"
}
slot1[1] = {
	type = "BattleBuffAddAttr"
}
slot2.trigger = {
	"onAttach"
}
slot2.arg_list = {
	number = -0.2,
	target = "TargetSelf",
	attr = "injureRatioByAir"
}
slot1[2] = {
	type = "BattleBuffAddAttr"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "竞技场我方加成",
	init_effect = "",
	picture = "",
	desc = "减少20%受到伤害",
	stack = 1,
	id = 49,
	icon = 49,
	last_effect = ""
}
