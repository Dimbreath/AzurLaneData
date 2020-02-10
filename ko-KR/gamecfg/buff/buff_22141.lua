slot2.trigger = {
	"onFire"
}
slot3.index = {
	1
}
slot2.arg_list = {
	countTarget = 12,
	countType = 22140
}
slot1[1] = {
	type = "BattleBuffCount"
}
slot2.trigger = {
	"onBattleBuffCount"
}
slot2.arg_list = {
	skill_id = 22141,
	target = "TargetSelf",
	countType = 22140
}
slot1[2] = {
	type = "BattleBuffCastSkill"
}
slot0.effect_list = {}
slot0[1] = {
	desc = "主炮每进行12次攻击，触发全弹发射-{namecode:46}级I"
}

return {
	time = 0,
	name = "全弹发射",
	init_effect = "",
	id = 22141,
	picture = "",
	desc = "主炮每进行12次攻击，触发全弹发射-{namecode:46}级I",
	stack = 1,
	color = "red",
	icon = 20100,
	last_effect = ""
}
