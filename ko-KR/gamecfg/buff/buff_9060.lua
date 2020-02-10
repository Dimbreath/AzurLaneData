slot0.blink = {
	1,
	0,
	0,
	0.3,
	0.3
}
slot2.trigger = {
	"onAttach",
	"onRemove"
}
slot2.arg_list = {
	number = 3540,
	attr = "cannonPower"
}
slot1[1] = {
	type = "BattleBuffAddAttrRatio"
}
slot0.effect_list = {}

return {
	name = "火力全开-LV8",
	init_effect = "jinengchufared",
	id = 9060,
	time = 10,
	picture = "",
	desc = "炮击伤害提高",
	stack = 1,
	color = "red",
	icon = 9060,
	last_effect = ""
}
