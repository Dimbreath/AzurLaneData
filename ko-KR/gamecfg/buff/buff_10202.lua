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
	attr = "damageRatioBullet"
}
slot1[1] = {
	type = "BattleBuffAddAttr"
}
slot0.effect_list = {}

return {
	name = "LuckyE",
	init_effect = "jinengchufared",
	time = 8,
	picture = "",
	desc = "伤害提高",
	stack = 1,
	id = 10202,
	icon = 10202,
	last_effect = ""
}
