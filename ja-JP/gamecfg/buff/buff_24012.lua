slot2.trigger = {
	"onFire"
}
slot3.index = {
	1
}
slot2.arg_list = {
	countTarget = 10,
	countType = 24010
}
slot1[1] = {
	type = "BattleBuffCount"
}
slot2.trigger = {
	"onBattleBuffCount"
}
slot2.arg_list = {
	buff_id = 24016,
	target = "TargetSelf",
	countType = 24010
}
slot1[2] = {
	type = "BattleBuffAddBuff"
}
slot0.effect_list = {}
slot0[1] = {
	desc = "主炮每进行10次攻击，触发全弹发射-鞍山级II"
}

return {
	time = 0,
	name = "全弹发射",
	init_effect = "",
	id = 24012,
	picture = "",
	desc = "主炮每进行10次攻击，触发全弹发射-鞍山级II",
	stack = 1,
	color = "red",
	icon = 20000,
	last_effect = ""
}
