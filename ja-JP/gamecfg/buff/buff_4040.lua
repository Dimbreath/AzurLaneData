slot0.blink = {
	0,
	0.7,
	1,
	0.3,
	0.3
}
slot2.trigger = {
	"onTakeDamage"
}
slot2.arg_list = {
	number = 0.5
}
slot1[1] = {
	type = "BattleBuffHPLink"
}
slot0.effect_list = {}

return {
	name = "吸引火力",
	init_effect = "jinengchufablue",
	id = 4041,
	time = 8,
	picture = "",
	desc = "承受先锋队伍受到的50%伤害",
	stack = 1,
	color = "yellow",
	icon = 4040,
	last_effect = ""
}
