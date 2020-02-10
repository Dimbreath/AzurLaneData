slot2.trigger = {
	"onAttach",
	"onRemove"
}
slot2.arg_list = {
	number = -400,
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
	number = -400,
	attr = "torpedoPower"
}
slot1[2] = {
	type = "BattleBuffAddAttrRatio"
}
slot2.trigger = {
	"onAttach",
	"onRemove"
}
slot2.arg_list = {
	number = -400,
	attr = "airPower"
}
slot1[3] = {
	type = "BattleBuffAddAttrRatio"
}
slot0.effect_list = {}

return {
	time = 10,
	name = "爱碳光波-II",
	init_effect = "",
	picture = "",
	desc = "敌方属性下降4%",
	stack = 1,
	id = 104013,
	icon = 104010,
	last_effect = "Darkness"
}
