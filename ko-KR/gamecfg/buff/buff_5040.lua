slot0.blink = {
	0.8,
	0.8,
	0.8,
	0.3,
	0.3
}
slot2.trigger = {
	"onAttach",
	"onRemove"
}
slot2.arg_list = {
	number = -0.25,
	attr = "dodgeRateExtra"
}
slot1[1] = {
	type = "BattleBuffAddAttr"
}
slot0.effect_list = {}

return {
	name = "照明弹",
	init_effect = "",
	id = 5040,
	time = 0,
	picture = "",
	desc = "回避率降低",
	stack = 1,
	color = "yellow",
	icon = 5040,
	last_effect = "EVDdowm"
}
