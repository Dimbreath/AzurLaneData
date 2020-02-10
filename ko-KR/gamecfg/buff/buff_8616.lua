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
	number = 0.35,
	attr = "damageRatioBullet"
}
slot1[1] = {
	type = "BattleBuffAddAttr"
}
slot2.trigger = {
	"onAttach"
}
slot2.arg_list = {
	quota = 1,
	skill_id = 8616,
	target = "TargetSelf"
}
slot1[2] = {
	type = "BattleBuffCastSkill"
}
slot0.effect_list = {}

return {
	name = "13章瑞鹤狂暴",
	init_effect = "jinengchufared",
	id = 8616,
	time = 0,
	picture = "",
	desc = "",
	stack = 1,
	color = "yellow",
	icon = 2120,
	last_effect = ""
}
