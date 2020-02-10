slot0.blink = {
	0,
	0.7,
	1,
	0.3,
	0.3
}
slot2.trigger = {
	"onAttach",
	"onRemove"
}
slot2.arg_list = {
	number = -0.2,
	attr = "injureRatio"
}
slot1[1] = {
	type = "BattleBuffAddAttr"
}
slot0.effect_list = {}

return {
	desc_get = "",
	name = "底力爆发",
	init_effect = "",
	id = 19042,
	time = 0,
	picture = "",
	desc = "受到伤害降低",
	stack = 1,
	color = "blue",
	icon = 19040,
	last_effect = ""
}
