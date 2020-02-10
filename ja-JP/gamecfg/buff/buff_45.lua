slot0.limit = {}
slot2.trigger = {
	"onAttach",
	"onStack"
}
slot2.arg_list = {
	number = 500,
	attr = "loadSpeed"
}
slot1[1] = {
	type = "BattleBuffAddAttrRatio"
}
slot2.trigger = {
	"onAttach",
	"onStack"
}
slot2.arg_list = {
	number = 0.05,
	attr = "damageRatioBullet"
}
slot1[2] = {
	type = "BattleBuffAddAttr"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "游刃有余",
	init_effect = "",
	picture = "",
	desc = "每堆叠1层，伤害、装填提高5%",
	stack = 5,
	id = 45,
	icon = 45,
	last_effect = ""
}
