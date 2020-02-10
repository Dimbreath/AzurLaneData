slot1[1] = SYSTEM_SCENARIO
slot1[2] = SYSTEM_ROUTINE
slot0.limit = {}
slot2.trigger = {
	"onAttach"
}
slot2.arg_list = {
	number = -0.15,
	attr = "injureRatio"
}
slot1[1] = {
	type = "BattleBuffAddAttr"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "重巡竞技场加成",
	init_effect = "",
	picture = "",
	desc = "免伤15%%",
	stack = 1,
	id = 63,
	icon = 63,
	last_effect = ""
}
