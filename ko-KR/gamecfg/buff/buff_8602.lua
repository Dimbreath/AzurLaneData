slot2.trigger = {
	"onAttach",
	"onRemove"
}
slot2.arg_list = {
	number = 6,
	attr = "injureRatioByCannon"
}
slot1[1] = {
	type = "BattleBuffAddAttr"
}
slot2.trigger = {
	"onAttach",
	"onRemove"
}
slot2.arg_list = {
	number = -0.5,
	attr = "injureRatioByBulletTorpedo"
}
slot1[2] = {
	type = "BattleBuffAddAttr"
}
slot2.trigger = {
	"onAttach",
	"onRemove"
}
slot2.arg_list = {
	number = -0.5,
	attr = "injureRatioByAir"
}
slot1[3] = {
	type = "BattleBuffAddAttr"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "炮击易伤",
	init_effect = "",
	id = 8602,
	picture = "",
	desc = "炮击易伤",
	stack = 1,
	color = "red",
	icon = 2120,
	last_effect = "Darkness"
}
