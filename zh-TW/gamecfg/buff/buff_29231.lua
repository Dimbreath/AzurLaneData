slot2.trigger = {
	"onFire"
}
slot3.index = {
	1
}
slot2.arg_list = {
	countTarget = 12,
	countType = 29230
}
slot1[1] = {
	type = "BattleBuffCount"
}
slot2.trigger = {
	"onBattleBuffCount"
}
slot2.arg_list = {
	skill_id = 29231,
	target = "TargetSelf",
	countType = 29230
}
slot1[2] = {
	type = "BattleBuffCastSkill"
}
slot0.effect_list = {}
slot0[1] = {
	desc = "主炮每进行12次攻击，触发专属弹幕-海王星I"
}

return {
	desc_get = "主炮每进行12次攻击，触发专属弹幕-海王星I",
	name = "专属弹幕-海王星I",
	init_effect = "",
	id = 29231,
	time = 0,
	picture = "",
	desc = "主炮每进行12次攻击，触发专属弹幕-海王星I",
	stack = 1,
	color = "red",
	icon = 29230,
	last_effect = ""
}
