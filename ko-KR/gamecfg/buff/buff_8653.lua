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
	skill_id = 8655,
	target = "TargetSelf"
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {
	"onAttach"
}
slot2.arg_list = {
	number = -0.1,
	attr = "damageRatioBullet"
}
slot1[2] = {
	type = "BattleBuffAddAttr"
}
slot0.effect_list = {}

return {
	name = "boss mio",
	init_effect = "jinengchufablue",
	id = 8653,
	time = 0,
	picture = "",
	desc = "伤害降低",
	stack = 1,
	color = "yellow",
	icon = 8653,
	last_effect = ""
}
