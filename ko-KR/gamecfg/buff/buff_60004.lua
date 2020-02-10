slot2.trigger = {
	"onAttach",
	"onRemove"
}
slot2.arg_list = {
	group = 60004,
	number = 1,
	attr = "DMG_TAG_EHC_T_1"
}
slot1[1] = {
	type = "BattleBuffAddAttr"
}
slot0.effect_list = {}
slot3.trigger = {
	"onAttach",
	"onRemove"
}
slot3.arg_list = {
	group = 60004,
	number = 1,
	attr = "DMG_TAG_EHC_T_1"
}
slot2[1] = {
	type = "BattleBuffAddAttr"
}
slot1.effect_list = {}
slot0[1] = {
	desc = "测试对固定类型舰娘的伤害加成"
}

return {
	time = 60,
	name = "测试对固定类型舰娘的伤害加成",
	init_effect = "",
	picture = "",
	desc = "测试对固定类型舰娘的伤害加成",
	stack = 1,
	id = 60004,
	icon = 60004,
	last_effect = "fensebuff"
}
