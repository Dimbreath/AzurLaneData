slot0.blink = {
	1,
	0,
	0,
	0.3,
	0.3
}
slot2.trigger = {
	"onAttach"
}
slot2.arg_list = {
	number = 300,
	attr = "airPower"
}
slot1[1] = {
	type = "BattleBuffAddAttrRatio"
}
slot0.effect_list = {}

return {
	name = "传颂之物后排航空上升3%",
	init_effect = "jinengchufared",
	id = 7542,
	time = 0,
	picture = "",
	desc = "传颂之物后排航空上升3%",
	stack = 1,
	color = "red",
	icon = 7540,
	last_effect = ""
}
