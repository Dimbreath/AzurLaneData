slot2.trigger = {
	"onFire"
}
slot3.index = {
	1
}
slot2.arg_list = {
	countTarget = 16,
	countType = 29350
}
slot1[1] = {
	type = "BattleBuffCount"
}
slot2.trigger = {
	"onBattleBuffCount"
}
slot2.arg_list = {
	skill_id = 29351,
	target = "TargetSelf",
	countType = 29350
}
slot1[2] = {
	type = "BattleBuffCastSkill"
}
slot0.effect_list = {}
slot0[1] = {
	desc = "主炮每进行16次攻击，触发专属弹幕-圣地亚哥"
}

return {
	desc_get = "主炮每进行16次攻击，触发专属弹幕-圣地亚哥",
	name = "专属弹幕-圣地亚哥",
	init_effect = "",
	id = 29351,
	time = 0,
	picture = "",
	desc = "主炮每进行16次攻击，触发专属弹幕-圣地亚哥",
	stack = 1,
	color = "red",
	icon = 29350,
	last_effect = ""
}
