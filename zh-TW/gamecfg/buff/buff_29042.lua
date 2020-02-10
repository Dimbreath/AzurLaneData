slot2.trigger = {
	"onFire"
}
slot3.index = {
	1
}
slot2.arg_list = {
	countTarget = 10,
	countType = 29040
}
slot1[1] = {
	type = "BattleBuffCount"
}
slot2.trigger = {
	"onBattleBuffCount"
}
slot2.arg_list = {
	skill_id = 29042,
	target = "TargetSelf",
	countType = 29040
}
slot1[2] = {
	type = "BattleBuffCastSkill"
}
slot0.effect_list = {}
slot0[1] = {
	desc = "主炮每进行10次攻击，触发专属弹幕-约翰斯顿II"
}

return {
	desc_get = "主炮每进行10次攻击，触发专属弹幕-约翰斯顿II",
	name = "专属弹幕-约翰斯顿II",
	init_effect = "",
	id = 29042,
	time = 0,
	picture = "",
	desc = "主炮每进行10次攻击，触发专属弹幕-约翰斯顿II",
	stack = 1,
	color = "red",
	icon = 29000,
	last_effect = ""
}
