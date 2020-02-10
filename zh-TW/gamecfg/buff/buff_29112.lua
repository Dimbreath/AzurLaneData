slot2.trigger = {
	"onFire"
}
slot3.index = {
	1
}
slot2.arg_list = {
	countTarget = 10,
	countType = 29110
}
slot1[1] = {
	type = "BattleBuffCount"
}
slot2.trigger = {
	"onBattleBuffCount"
}
slot2.arg_list = {
	skill_id = 29112,
	target = "TargetSelf",
	countType = 29110
}
slot1[2] = {
	type = "BattleBuffCastSkill"
}
slot0.effect_list = {}
slot0[1] = {
	desc = "主炮每进行10次攻击，触发专属弹幕-{namecode:6}II"
}

return {
	desc_get = "主炮每进行10次攻击，触发专属弹幕-{namecode:6}II",
	name = "专属弹幕-{namecode:6}II",
	init_effect = "",
	id = 29112,
	time = 0,
	picture = "",
	desc = "主炮每进行10次攻击，触发专属弹幕-{namecode:6}II",
	stack = 1,
	color = "red",
	icon = 29110,
	last_effect = ""
}
