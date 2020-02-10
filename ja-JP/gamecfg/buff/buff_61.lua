slot1[1] = SYSTEM_SCENARIO
slot1[2] = SYSTEM_ROUTINE
slot0.limit = {}
slot2.trigger = {
	"onAttach"
}
slot2.arg_list = {
	number = 0.05,
	attr = "dodgeRateExtra"
}
slot1[1] = {
	type = "BattleBuffAddAttr"
}
slot2.trigger = {
	"onAttach"
}
slot2.arg_list = {
	number = -0.25,
	attr = "injureRatio"
}
slot1[2] = {
	type = "BattleBuffAddAttr"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "驱逐竞技场加成",
	init_effect = "",
	picture = "",
	desc = "额外提升闪避5%",
	stack = 1,
	id = 61,
	icon = 61,
	last_effect = ""
}
