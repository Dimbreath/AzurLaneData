slot2.trigger = {
	"onFire"
}
slot3.index = {
	1
}
slot2.arg_list = {
	countTarget = 15,
	countType = 29490
}
slot1[1] = {
	type = "BattleBuffCount"
}
slot2.trigger = {
	"onBattleBuffCount"
}
slot2.arg_list = {
	skill_id = 29491,
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
	id = 29491,
	picture = "",
	desc = "主炮每进行15次攻击，触发专属弹幕-黛朵I",
	stack = 1,
	color = "red",
	icon = 29490,
	last_effect = ""
}
