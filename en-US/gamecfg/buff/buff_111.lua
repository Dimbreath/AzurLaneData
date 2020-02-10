slot2.trigger = {
	"onAttach"
}
slot2.arg_list = {
	number = -500,
	attr = "cannonPower"
}
slot1[1] = {
	type = "BattleBuffAddAttrRatio"
}
slot2.trigger = {
	"onAttach"
}
slot2.arg_list = {
	number = -500,
	attr = "torpedoPower"
}
slot1[2] = {
	type = "BattleBuffAddAttrRatio"
}
slot2.trigger = {
	"onAttach"
}
slot2.arg_list = {
	number = 3000,
	attr = "dodgeRate"
}
slot1[3] = {
	type = "BattleBuffAddAttrRatio"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "复纵阵回避",
	init_effect = "",
	id = 111,
	picture = "",
	desc = "机动提高30%，炮击和雷击降低5%",
	stack = 1,
	color = "yellow",
	icon = 111,
	last_effect = ""
}
