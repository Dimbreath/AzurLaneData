slot2.trigger = {
	"onChargeWeaponFire"
}
slot2.arg_list = {
	rant = 10000,
	skill_id = 1,
	target = "TargetSelf",
	time = 1
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot0.effect_list = {}
slot3.trigger = {
	"onChargeWeaponFire"
}
slot3.arg_list = {
	rant = 10000,
	skill_id = 1,
	target = "TargetSelf",
	time = 1
}
slot2[1] = {
	type = "BattleBuffCastSkill"
}
slot1.effect_list = {}
slot0[1] = {
	desc = "中型/重型主炮开火时有几率发动，额外进行一轮攻击"
}

return {
	time = 0,
	name = "主炮连射",
	init_effect = "",
	picture = "",
	desc = "重型主炮开火时有几率发动，额外进行一轮攻击",
	stack = 1,
	id = 1,
	icon = 1,
	last_effect = ""
}
