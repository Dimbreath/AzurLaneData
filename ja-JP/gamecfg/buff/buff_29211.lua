slot2.trigger = {
	"onFire"
}
slot3.index = {
	1
}
slot2.arg_list = {
	countTarget = 15,
	countType = 29210
}
slot1[1] = {
	type = "BattleBuffCount"
}
slot2.trigger = {
	"onBattleBuffCount"
}
slot2.arg_list = {
	skill_id = 29211,
	target = "TargetSelf",
	countType = 29210
}
slot1[2] = {
	type = "BattleBuffCastSkill"
}
slot0.effect_list = {}
slot0[1] = {
	desc = "主炮每进行15次攻击，触发专属弹幕-Z46I"
}

return {
	desc_get = "主炮每进行15次攻击，触发专属弹幕-Z46I",
	name = "专属弹幕-Z46I",
	init_effect = "",
	id = 29211,
	time = 0,
	picture = "",
	desc = "主炮每进行15次攻击，触发专属弹幕-Z46I",
	stack = 1,
	color = "red",
	icon = 29210,
	last_effect = ""
}
