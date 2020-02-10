slot2.trigger = {
	"onFire"
}
slot3.index = {
	1
}
slot2.arg_list = {
	countTarget = 10,
	countType = 29180
}
slot1[1] = {
	type = "BattleBuffCount"
}
slot2.trigger = {
	"onBattleBuffCount"
}
slot2.arg_list = {
	skill_id = 29182,
	target = "TargetSelf",
	countType = 29180
}
slot1[2] = {
	type = "BattleBuffCastSkill"
}
slot0.effect_list = {}
slot0[1] = {
	desc = "主炮每进行10次攻击，触发专属弹幕-鞍山II"
}

return {
	desc_get = "主炮每进行10次攻击，触发专属弹幕-鞍山II",
	name = "专属弹幕-鞍山II",
	init_effect = "",
	id = 29182,
	time = 0,
	picture = "",
	desc = "主炮每进行10次攻击，触发专属弹幕-鞍山II",
	stack = 1,
	color = "red",
	icon = 29000,
	last_effect = ""
}
