slot2.trigger = {
	"onUpdate"
}
slot2.arg_list = {
	k = 1.5,
	attr = "cannonPower",
	time = 2,
	dotType = 1,
	number = 5
}
slot1[1] = {
	type = "BattleBuffDOT"
}
slot0.effect_list = {}

return {
	time = 10,
	name = "起火",
	init_effect = "",
	picture = "",
	desc = "持续伤害",
	stack = 1,
	id = 20,
	icon = 20,
	last_effect = "zhuoshao"
}
