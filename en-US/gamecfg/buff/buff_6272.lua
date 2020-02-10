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
	name = "机动回避",
	init_effect = "jinengchufablue",
	time = 2,
	picture = "",
	desc = "完全闪避",
	stack = 1,
	id = 6272,
	icon = 6272,
	last_effect = ""
}
