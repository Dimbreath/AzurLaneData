slot2.trigger = {
	"onFire"
}
slot3.index = {
	1
}
slot2.arg_list = {
	countTarget = 12,
	countType = 29240
}
slot1[1] = {
	type = "BattleBuffCount"
}
slot2.trigger = {
	"onBattleBuffCount"
}
slot2.arg_list = {
	skill_id = 29241,
	target = "TargetSelf",
	countType = 29240
}
slot1[2] = {
	type = "BattleBuffCastSkill"
}
slot0.effect_list = {}
slot0[1] = {
	desc = "主炮每进行12次攻击，触发专属弹幕-罗恩I"
}

return {
	desc_get = "主炮每进行12次攻击，触发专属弹幕-罗恩I",
	name = "专属弹幕-罗恩I",
	init_effect = "",
	id = 29241,
	time = 0,
	picture = "",
	desc = "主炮每进行12次攻击，触发专属弹幕-罗恩I",
	stack = 1,
	color = "red",
	icon = 29240,
	last_effect = ""
}
