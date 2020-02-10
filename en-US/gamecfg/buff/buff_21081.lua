slot2.trigger = {
	"onFire"
}
slot3.index = {
	1
}
slot2.arg_list = {
	countTarget = 15,
	countType = 21080
}
slot1[1] = {
	type = "BattleBuffCount"
}
slot2.trigger = {
	"onBattleBuffCount"
}
slot2.arg_list = {
	skill_id = 21081,
	target = "TargetSelf",
	countType = 21080
}
slot1[2] = {
	type = "BattleBuffCastSkill"
}
slot0.effect_list = {}
slot0[1] = {
	desc = "主炮每进行15次攻击，触发全弹发射-M级I"
}

return {
	time = 0,
	name = "全弹发射",
	init_effect = "",
	id = 21081,
	picture = "",
	desc = "主炮每进行15次攻击，触发全弹发射-M级I",
	stack = 1,
	color = "red",
	icon = 20000,
	last_effect = ""
}
