slot2.trigger = {
	"onAttach",
	"onRemove"
}
slot2.arg_list = {
	number = 0.05,
	attr = "injureRatioByAir"
}
slot1[1] = {
	type = "BattleBuffAddAttr"
}
slot2.trigger = {
	"onAttach",
	"onRemove"
}
slot2.arg_list = {
	number = -0.1,
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
	number = -0.1,
	attr = "injureRatioByBulletTorpedo"
}
slot1[3] = {
	type = "BattleBuffAddAttr"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "2019年2月世界BOSS二阶段易伤",
	init_effect = "",
	id = 8604,
	picture = "",
	desc = "航空易伤",
	stack = 1,
	color = "yellow",
	icon = 2120,
	last_effect = "Darkness"
}
