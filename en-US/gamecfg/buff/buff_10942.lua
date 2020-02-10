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
	attr = "dodgeRate"
}
slot1[1] = {
	type = "BattleBuffAddAttrRatio"
}
slot0.effect_list = {}

return {
	name = "鬼神演舞",
	init_effect = "jinengchufablue",
	id = 10942,
	time = 5,
	picture = "",
	desc = "提高机动属性",
	stack = 1,
	color = "red",
	icon = 10942,
	last_effect = ""
}
