slot2.trigger = {
	"onFire"
}
slot3.index = {
	1
}
slot2.arg_list = {
	countTarget = 16,
	countType = 29380
}
slot1[1] = {
	type = "BattleBuffCount"
}
slot2.trigger = {
	"onBattleBuffCount"
}
slot2.arg_list = {
	skill_id = 29382,
	target = "TargetSelf",
	countType = 29380
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
	id = 29382,
	picture = "",
	desc = "主炮每进行16次攻击，触发专属弹幕-北风II",
	stack = 1,
	color = "red",
	icon = 29380,
	last_effect = ""
}
