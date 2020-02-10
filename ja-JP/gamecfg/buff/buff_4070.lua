slot0.blink = {
	0,
	0.7,
	1,
	0.3,
	0.3
}
slot2.trigger = {
	"onAttach",
	"onRemove"
}
slot2.arg_list = {
	number = 1,
	attr = "perfectDodge"
}
slot1[1] = {
	type = "BattleBuffAddAttr"
}
slot0.effect_list = {}

return {
	name = "紧急回避",
	init_effect = "jinengchufablue",
	id = 4070,
	time = 6,
	picture = "",
	desc = "完全闪避",
	stack = 1,
	color = "blue",
	icon = 4070,
	last_effect = ""
}
