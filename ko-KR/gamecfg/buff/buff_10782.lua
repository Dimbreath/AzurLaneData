slot0.blink = {
	1,
	0,
	0,
	0.3,
	0.3
}
slot2.trigger = {
	"onBulletCreate"
}
slot2.arg_list = {
	number = 0.2,
	attr = "cri"
}
slot1[1] = {
	type = "BattleBuffAddBulletAttr"
}
slot2.trigger = {
	"onBulletCreate"
}
slot2.arg_list = {
	number = 0.5,
	attr = "criDamage"
}
slot1[2] = {
	type = "BattleBuffAddBulletAttr"
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
	name = "幸运暴击",
	init_effect = "jinengchufared",
	time = 5,
	picture = "",
	desc = "暴击提升，暴击伤害提升",
	stack = 1,
	id = 10782,
	icon = 10782,
	last_effect = ""
}
