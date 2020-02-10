slot1[1] = SYSTEM_SCENARIO
slot1[2] = SYSTEM_ROUTINE
slot0.limit = {}
slot2.trigger = {
	"onAttach"
}
slot2.arg_list = {
	number = -0.1,
	attr = "damageRatioBullet"
}
slot1[1] = {
	type = "BattleBuffAddAttr"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "轻母竞技场加成",
	init_effect = "",
	picture = "",
	desc = "伤害降低10%",
	stack = 1,
	id = 66,
	icon = 66,
	last_effect = ""
}
