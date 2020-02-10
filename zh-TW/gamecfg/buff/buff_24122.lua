slot2.trigger = {
	"onFire"
}
slot3.index = {
	1,
	2
}
slot2.arg_list = {
	countTarget = 12,
	countType = 24120
}
slot1[1] = {
	type = "BattleBuffCount"
}
slot2.trigger = {
	"onBattleBuffCount"
}
slot2.arg_list = {
	skill_id = 24122,
	target = "TargetSelf",
	countType = 24120
}
slot1[2] = {
	type = "BattleBuffCastSkill"
}
slot0.effect_list = {}
slot0[1] = {
	desc = "主炮每进行12次攻击，触发全弹发射-逸仙II"
}

return {
	time = 0,
	name = "全弹发射",
	init_effect = "",
	id = 24122,
	picture = "",
	desc = "主炮每进行12次攻击，触发全弹发射-逸仙II",
	stack = 1,
	color = "red",
	icon = 20100,
	last_effect = ""
}
