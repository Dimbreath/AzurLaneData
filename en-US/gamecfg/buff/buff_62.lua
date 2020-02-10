slot1[1] = SYSTEM_SCENARIO
slot1[2] = SYSTEM_ROUTINE
slot0.limit = {}
slot2.trigger = {
	"onAttach"
}
slot2.arg_list = {
	number = 0.15,
	attr = "damageRatioBullet"
}
slot1[1] = {
	type = "BattleBuffAddAttr"
}
slot2.trigger = {
	"onAttach"
}
slot2.arg_list = {
	number = -0.2,
	attr = "injureRatio"
}
slot1[2] = {
	type = "BattleBuffAddAttr"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "轻巡竞技场加成",
	init_effect = "",
	picture = "",
	desc = "额外提升伤害15%",
	stack = 1,
	id = 62,
	icon = 62,
	last_effect = ""
}
