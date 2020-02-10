slot2.trigger = {
	"onAttach",
	"onRemove"
}
slot2.arg_list = {
	number = 11,
	attr = "injureRatioByBulletTorpedo"
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
	attr = "injureRatioByCannon"
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
	name = "鱼雷易伤",
	init_effect = "",
	id = 8603,
	picture = "",
	desc = "鱼雷易伤",
	stack = 1,
	color = "blue",
	icon = 2120,
	last_effect = "Darkness"
}
