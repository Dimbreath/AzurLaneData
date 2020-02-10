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
	number = 0.04,
	attr = "damageRatioBullet"
}
slot1[1] = {
	type = "BattleBuffAddAttr"
}
slot0.effect_list = {}

return {
	name = "队伍伤害提高30%",
	init_effect = "jinengchufared",
	time = 0,
	picture = "",
	desc = "队伍伤害提高30%",
	stack = 1,
	id = 8049,
	icon = 8049,
	last_effect = ""
}
