slot2.trigger = {
	"onFire"
}
slot3.index = {
	1
}
slot2.arg_list = {
	countTarget = 10,
	countType = 22040
}
slot1[1] = {
	type = "BattleBuffCount"
}
slot2.trigger = {
	"onBattleBuffCount"
}
slot2.arg_list = {
	skill_id = 22042,
	target = "TargetSelf",
	countType = 22040
}
slot1[2] = {
	type = "BattleBuffCastSkill"
}
slot0.effect_list = {}
slot0[1] = {
	desc = "主炮每进行10次攻击，触发全弹发射-{namecode:30}级II"
}

return {
	time = 0,
	name = "全弹发射",
	init_effect = "",
	id = 22042,
	picture = "",
	desc = "主炮每进行10次攻击，触发全弹发射-{namecode:30}级II",
	stack = 1,
	color = "red",
	icon = 20000,
	last_effect = ""
}
