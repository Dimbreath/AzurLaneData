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
	number = 1,
	attr = "perfectDodge"
}
slot1[1] = {
	type = "BattleBuffAddAttr"
}
slot2.trigger = {
	"onAttach",
	"onRemove"
}
slot2.arg_list = {
	number = 1,
	attr = "immuneDirectHit"
}
slot1[2] = {
	type = "BattleBuffAddAttr"
}
slot0.effect_list = {}

return {
	name = "LuckyE",
	init_effect = "jinengchufared",
	time = 8,
	picture = "",
	desc = "无敌",
	stack = 1,
	id = 10203,
	icon = 10203,
	last_effect = ""
}
