slot2.trigger = {
	"onFire"
}
slot3.index = {
	1
}
slot2.arg_list = {
	countTarget = 9,
	countType = 29220
}
slot1[1] = {
	type = "BattleBuffCount"
}
slot2.trigger = {
	"onBattleBuffCount"
}
slot2.arg_list = {
	skill_id = 29221,
	target = "TargetSelf",
	countType = 29220
}
slot1[2] = {
	type = "BattleBuffCastSkill"
}
slot0.effect_list = {}
slot0[1] = {
	desc = "主炮每进行9次攻击，触发专属弹幕-伊吹I"
}

return {
	desc_get = "主炮每进行9次攻击，触发专属弹幕-伊吹I",
	name = "专属弹幕-伊吹I",
	init_effect = "",
	id = 29221,
	time = 0,
	picture = "",
	desc = "主炮每进行9次攻击，触发专属弹幕-伊吹I",
	stack = 1,
	color = "red",
	icon = 29220,
	last_effect = ""
}
