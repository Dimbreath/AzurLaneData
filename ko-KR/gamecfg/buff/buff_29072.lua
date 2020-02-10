slot2.trigger = {
	"onFire"
}
slot3.index = {
	1
}
slot2.arg_list = {
	countTarget = 10,
	countType = 29070
}
slot1[1] = {
	type = "BattleBuffCount"
}
slot2.trigger = {
	"onBattleBuffCount"
}
slot2.arg_list = {
	skill_id = 29072,
	target = "TargetSelf",
	countType = 29070
}
slot1[2] = {
	type = "BattleBuffCastSkill"
}
slot0.effect_list = {}
slot0[1] = {
	desc = "主炮每进行10次攻击，触发专属弹幕-勇敢II"
}

return {
	desc_get = "主炮每进行10次攻击，触发专属弹幕-勇敢II",
	name = "专属弹幕-勇敢II",
	init_effect = "",
	id = 29072,
	time = 0,
	picture = "",
	desc = "主炮每进行10次攻击，触发专属弹幕-勇敢II",
	stack = 1,
	color = "red",
	icon = 29000,
	last_effect = ""
}
