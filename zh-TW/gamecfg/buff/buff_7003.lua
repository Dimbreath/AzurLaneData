slot2.trigger = {
	"onAttach"
}
slot2.arg_list = {
	group = 0,
	number = 10000,
	attr = "maxHP"
}
slot1[1] = {
	type = "BattleBuffAddAttrRatio"
}
slot2.trigger = {
	"onAttach",
	"onRemove"
}
slot2.arg_list = {
	ai_onRemove = 10012,
	ai_onAttach = 10012
}
slot1[2] = {
	type = "BattleBuffNewAI"
}
slot2.trigger = {
	"onAttach"
}
slot2.arg_list = {
	group = 0,
	number = 10000,
	attr = "armor"
}
slot1[3] = {
	type = "BattleBuffAddAttrRatio"
}
slot2.trigger = {
	"onUpdate",
	"onRemove"
}
slot2.arg_list = {
	buff_id = 7006,
	exceptCaster = true,
	target = "TargetAllHelp",
	max_distance = 20
}
slot1[4] = {
	type = "BattleBuffAura"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "精英怪-旗舰",
	init_effect = "",
	picture = "",
	desc = "精英怪-旗舰-暂时无用，里面的具体配置也是有问题的",
	stack = 1,
	id = 7003,
	icon = 7003,
	last_effect = "jingyingguaibuffjinse"
}
