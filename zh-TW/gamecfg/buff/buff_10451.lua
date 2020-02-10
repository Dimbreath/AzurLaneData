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
slot0[1] = {
	time = 5
}
slot0[2] = {
	time = 6
}
slot0[3] = {
	time = 7
}
slot0[4] = {
	time = 8
}
slot0[5] = {
	time = 9
}
slot0[6] = {
	time = 10
}
slot0[7] = {
	time = 11
}
slot0[8] = {
	time = 12
}
slot0[9] = {
	time = 13
}
slot0[10] = {
	time = 15
}

return {
	name = "最后的反击",
	init_effect = "jinengchufablue",
	time = 5,
	picture = "",
	desc = "无敌",
	stack = 1,
	id = 10451,
	icon = 10451,
	last_effect = ""
}
