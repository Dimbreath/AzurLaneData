slot2.trigger = {
	"onFire"
}
slot3.index = {
	1
}
slot2.arg_list = {
	countTarget = 15,
	countType = 29390
}
slot1[1] = {
	type = "BattleBuffCount"
}
slot2.trigger = {
	"onBattleBuffCount"
}
slot2.arg_list = {
	skill_id = 29391,
	target = "TargetSelf",
	countType = 29390
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
	id = 29391,
	picture = "",
	desc = "主武器每进行15次攻击，触发专属弹幕-西雅图I",
	stack = 1,
	color = "red",
	icon = 29390,
	last_effect = ""
}
