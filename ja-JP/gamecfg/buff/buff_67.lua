slot1[1] = SYSTEM_SCENARIO
slot1[2] = SYSTEM_ROUTINE
slot0.limit = {}
slot2.trigger = {
	"onAttach"
}
slot2.arg_list = {
	number = -0.2,
	attr = "damageRatioBullet"
}
slot1[1] = {
	type = "BattleBuffAddAttr"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "航母竞技场加成",
	init_effect = "",
	picture = "",
	desc = "伤害降低20%",
	stack = 1,
	id = 67,
	icon = 67,
	last_effect = ""
}
