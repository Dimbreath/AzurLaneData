slot2.trigger = {
	"onAttach",
	"onRemove"
}
slot2.arg_list = {
	number = 10,
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
	attr = "injureRatioByBulletTorpedo"
}
slot1[3] = {
	type = "BattleBuffAddAttr"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "航空易伤",
	init_effect = "",
	id = 8601,
	picture = "",
	desc = "航空易伤",
	stack = 1,
	color = "yellow",
	icon = 2120,
	last_effect = "Darkness"
}
