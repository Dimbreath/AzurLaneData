slot2.trigger = {
	"onAttach",
	"onRemove"
}
slot2.arg_list = {
	number = -3000,
	attr = "loadSpeed"
}
slot1[1] = {
	type = "BattleBuffAddAttrRatio"
}
slot2.trigger = {
	"onAttach",
	"onRemove"
}
slot2.arg_list = {
	number = -0.15,
	attr = "damageRatioBullet"
}
slot1[2] = {
	type = "BattleBuffAddAttr"
}
slot0.effect_list = {}
slot0[1] = {
	time = 5
}
slot0[2] = {
	time = 5.5
}
slot0[3] = {
	time = 6
}
slot0[4] = {
	time = 6.5
}
slot0[5] = {
	time = 7
}
slot0[6] = {
	time = 7.5
}
slot0[7] = {
	time = 8
}
slot0[8] = {
	time = 8.5
}
slot0[9] = {
	time = 9
}
slot0[10] = {
	time = 10
}

return {
	time = 5,
	name = "火力干扰",
	init_effect = "",
	id = 5000,
	picture = "",
	desc = "装填降低30%，自身伤害降低15%",
	stack = 1,
	color = "yellow",
	icon = 5000,
	last_effect = "Darkness"
}
