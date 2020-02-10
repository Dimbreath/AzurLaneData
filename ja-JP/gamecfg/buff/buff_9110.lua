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
	number = -2240,
	attr = "cannonPower"
}
slot1[1] = {
	type = "BattleBuffAddAttrRatio"
}
slot2.trigger = {
	"onAttach",
	"onRemove"
}
slot2.arg_list = {
	number = 3760,
	attr = "antiAirPower"
}
slot1[2] = {
	type = "BattleBuffAddAttrRatio"
}
slot0.effect_list = {}

return {
	name = "防空模式-LV9",
	init_effect = "jinengchufablue",
	id = 9110,
	time = 3,
	picture = "",
	desc = "自身防空提高，炮击降低",
	stack = 1,
	color = "yellow",
	icon = 9110,
	last_effect = ""
}
