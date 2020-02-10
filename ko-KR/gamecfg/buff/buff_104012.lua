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
	number = 400,
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
	number = 400,
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
	number = 400,
	attr = "airPower"
}
slot1[3] = {
	type = "BattleBuffAddAttrRatio"
}
slot0.effect_list = {}

return {
	name = "爱碳光波-I",
	init_effect = "",
	time = 10,
	picture = "",
	desc = "敌方属性上升4%",
	stack = 1,
	id = 104012,
	icon = 104010,
	last_effect = "jinengchufared"
}
