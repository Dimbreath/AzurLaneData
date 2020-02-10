slot2.trigger = {
	"onFire"
}
slot3.index = {
	1
}
slot2.arg_list = {
	countTarget = 8,
	countType = 29100
}
slot1[1] = {
	type = "BattleBuffCount"
}
slot2.trigger = {
	"onBattleBuffCount"
}
slot2.arg_list = {
	skill_id = 29102,
	target = "TargetSelf",
	countType = 29100
}
slot1[2] = {
	type = "BattleBuffCastSkill"
}
slot0.effect_list = {}
slot0[1] = {
	desc = "主炮每进行8次攻击，触发专属弹幕-贝尔法斯特II"
}

return {
	desc_get = "主炮每进行8次攻击，触发专属弹幕-贝尔法斯特II",
	name = "专属弹幕-贝尔法斯特II",
	init_effect = "",
	id = 29102,
	time = 0,
	picture = "",
	desc = "主炮每进行8次攻击，触发专属弹幕-贝尔法斯特II",
	stack = 1,
	color = "red",
	icon = 29100,
	last_effect = ""
}
