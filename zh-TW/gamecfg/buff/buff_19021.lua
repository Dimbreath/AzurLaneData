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
	number = 3000,
	attr = "loadSpeed"
}
slot1[1] = {
	type = "BattleBuffAddAttrRatio"
}
slot0.effect_list = {}

return {
	name = "海之女神",
	init_effect = "jinengchufared",
	id = 19021,
	time = 15,
	picture = "",
	desc = "提高装填属性",
	stack = 1,
	color = "red",
	icon = 19021,
	last_effect = ""
}
