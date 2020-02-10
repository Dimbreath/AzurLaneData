slot2.trigger = {
	"onUpdate"
}
slot2.arg_list = {
	buff_id = 60046,
	exceptCaster = true,
	target = "TargetAllHelp",
	max_distance = 20
}
slot1[1] = {
	type = "BattleBuffAura"
}
slot2.trigger = {
	"onUpdate"
}
slot2.arg_list = {
	time = 10
}
slot1[2] = {
	type = "BattleBuffDeath"
}
slot2.trigger = {
	"onAttach",
	"onRemove"
}
slot2.arg_list = {
	group = 104,
	number = 1,
	attr = "isSpirit"
}
slot1[3] = {
	type = "BattleBuffAddAttr"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "测试-随机技能-治疗之泉-治疗光环",
	init_effect = "",
	picture = "",
	desc = "治疗光环",
	stack = 1,
	id = 60045,
	icon = 60045,
	last_effect = "hongsebuff"
}
