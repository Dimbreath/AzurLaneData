slot0.blink = {
	0,
	0.7,
	1,
	0.3,
	0.3
}
slot2.trigger = {
	"onAttach"
}
slot2.arg_list = {
	currentHPRatio = 0.9999,
	number = 1
}
slot1[1] = {
	type = "BattleBuffHP"
}
slot2.trigger = {
	"onAttach",
	"onRemove"
}
slot2.arg_list = {
	number = 1,
	attr = "isInvincible"
}
slot1[2] = {
	type = "BattleBuffAddAttr"
}
slot0.effect_list = {}

return {
	name = "铁底湾之夜",
	init_effect = "jinengchufablue",
	time = 5,
	picture = "",
	desc = "无敌",
	stack = 1,
	id = 11015,
	icon = 11015,
	last_effect = ""
}
