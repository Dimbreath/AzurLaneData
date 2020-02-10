slot0.blink = {
	1,
	0,
	0,
	0.3,
	0.3
}
slot2.trigger = {
	"onAttach",
	"onRemove"
}
slot2.arg_list = {
	number = 2080,
	attr = "cannonPower"
}
slot1[1] = {
	type = "BattleBuffAddAttrRatio"
}
slot2.trigger = {
	"onAttach",
	"onRemove"
}
slot2.arg_list = {
	number = 2080,
	attr = "attackRating"
}
slot1[2] = {
	type = "BattleBuffAddAttrRatio"
}
slot2.trigger = {
	"onAttach",
	"onRemove"
}
slot2.arg_list = {
	number = -0.127,
	attr = "injureRatio"
}
slot1[3] = {
	type = "BattleBuffAddAttr"
}
slot0.effect_list = {}

return {
	name = "所罗门的传说-LV8",
	init_effect = "jinengchufared",
	id = 9092,
	time = 8,
	picture = "",
	desc = "炮击、命中提高，受到伤害降低",
	stack = 1,
	color = "yellow",
	icon = 9090,
	last_effect = ""
}
