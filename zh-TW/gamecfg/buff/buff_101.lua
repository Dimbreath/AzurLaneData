slot2.trigger = {
	"onAttach"
}
slot2.arg_list = {
	number = 1500,
	attr = "cannonPower"
}
slot1[1] = {
	type = "BattleBuffAddAttrRatio"
}
slot2.trigger = {
	"onAttach"
}
slot2.arg_list = {
	number = 1500,
	attr = "torpedoPower"
}
slot1[2] = {
	type = "BattleBuffAddAttrRatio"
}
slot2.trigger = {
	"onAttach"
}
slot2.arg_list = {
	number = -1000,
	attr = "dodgeRate"
}
slot1[3] = {
	type = "BattleBuffAddAttrRatio"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "单纵阵突入",
	init_effect = "",
	id = 101,
	picture = "",
	desc = "炮击和雷击提高15%，机动降低10%",
	stack = 1,
	color = "yellow",
	icon = 101,
	last_effect = ""
}
