slot2.trigger = {
	"onAttach",
	"onRemove"
}
slot2.arg_list = {
	value = "farthest",
	attr = "TargetChoise"
}
slot1[1] = {
	type = "BattleBuffSetAttr"
}
slot0.effect_list = {}
slot3.trigger = {
	"onAttach",
	"onRemove"
}
slot3.arg_list = {
	value = "farthest",
	attr = "TargetChoise"
}
slot2[1] = {
	type = "BattleBuffSetAttr"
}
slot1.effect_list = {}
slot0[1] = {
	desc = "被击沉时，给同屏敌方角色造成一次巨大伤害"
}

return {
	time = 60,
	name = "测试目标选择-航母飞机后排优先",
	init_effect = "",
	picture = "",
	desc = "测试目标选择-航母飞机后排优先",
	stack = 1,
	id = 60003,
	icon = 60003,
	last_effect = "caisedian"
}
