slot2.trigger = {
	"onAttach",
	"onRemove"
}
slot2.arg_list = {
	group = 60009,
	number = 200,
	attr = "cannonPower"
}
slot1[1] = {
	type = "BattleBuffAddAttr"
}
slot2.trigger = {
	"onAttach",
	"onRemove"
}
slot2.arg_list = {
	group = 60009,
	number = 200,
	attr = "torpedoPower"
}
slot1[2] = {
	type = "BattleBuffAddAttr"
}
slot2.trigger = {
	"onAttach",
	"onRemove"
}
slot2.arg_list = {
	group = 60009,
	number = 200,
	attr = "airPower"
}
slot1[3] = {
	type = "BattleBuffAddAttr"
}
slot2.trigger = {
	"onAttach",
	"onRemove"
}
slot2.arg_list = {
	group = 60009,
	number = 200,
	attr = "antiAirPower"
}
slot1[4] = {
	type = "BattleBuffAddAttr"
}
slot0.effect_list = {}

return {
	time = 5,
	name = "测试-不死鸟-攻击加成",
	init_effect = "jiasuBUFF",
	picture = "",
	desc = "加攻击",
	stack = 1,
	id = 60009,
	icon = 60009,
	last_effect = "ATK"
}
