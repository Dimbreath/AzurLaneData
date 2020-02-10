slot2.trigger = {
	"onFire"
}
slot3.index = {
	1
}
slot2.arg_list = {
	countTarget = 12,
	countType = 20210
}
slot1[1] = {
	type = "BattleBuffCount"
}
slot2.trigger = {
	"onBattleBuffCount"
}
slot2.arg_list = {
	skill_id = 20211,
	target = "TargetSelf",
	countType = 20210
}
slot1[2] = {
	type = "BattleBuffCastSkill"
}
slot0.effect_list = {}
slot0[1] = {
	desc = "主炮每进行12次攻击，触发全弹发射-彭萨科拉级I"
}

return {
	time = 0,
	name = "全弹发射",
	init_effect = "",
	id = 20211,
	picture = "",
	desc = "主炮每进行12次攻击，触发全弹发射-彭萨科拉级I",
	stack = 1,
	color = "red",
	icon = 20200,
	last_effect = ""
}
