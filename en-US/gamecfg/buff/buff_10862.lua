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
	attr = "torpedoPower"
}
slot1[1] = {
	type = "BattleBuffAddAttrRatio"
}
slot0.effect_list = {}

return {
	name = "强袭模式·EX",
	init_effect = "jinengchufared",
	id = 10862,
	time = 5,
	picture = "",
	desc = "提高雷击属性",
	stack = 1,
	color = "red",
	icon = 10862,
	last_effect = ""
}
