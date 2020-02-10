slot2.trigger = {
	"onFire"
}
slot3.index = {
	1
}
slot2.arg_list = {
	countTarget = 6,
	countType = 29220
}
slot1[1] = {
	type = "BattleBuffCount"
}
slot2.trigger = {
	"onBattleBuffCount"
}
slot2.arg_list = {
	skill_id = 29222,
	target = "TargetSelf",
	countType = 29220
}
slot1[2] = {
	type = "BattleBuffCastSkill"
}
slot0.effect_list = {}
slot0[1] = {
	desc = "主炮每进行6次攻击，触发专属弹幕-伊吹II"
}

return {
	desc_get = "主炮每进行6次攻击，触发专属弹幕-伊吹II",
	name = "专属弹幕-伊吹II",
	init_effect = "",
	id = 29222,
	time = 0,
	picture = "",
	desc = "主炮每进行6次攻击，触发专属弹幕-伊吹II",
	stack = 1,
	color = "red",
	icon = 29220,
	last_effect = ""
}
