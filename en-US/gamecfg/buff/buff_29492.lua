slot2.trigger = {
	"onFire"
}
slot3.index = {
	1
}
slot2.arg_list = {
	countTarget = 10,
	countType = 29490
}
slot1[1] = {
	type = "BattleBuffCount"
}
slot2.trigger = {
	"onBattleBuffCount"
}
slot2.arg_list = {
	skill_id = 29492,
	target = "TargetSelf",
	countType = 29490
}
slot1[2] = {
	type = "BattleBuffCastSkill"
}
slot0.effect_list = {}
slot0[1] = {}

return {
	time = 0,
	name = "专属弹幕",
	init_effect = "",
	id = 29492,
	picture = "",
	desc = "主炮每进行10次攻击，触发专属弹幕-黛朵II",
	stack = 1,
	color = "red",
	icon = 29490,
	last_effect = ""
}
