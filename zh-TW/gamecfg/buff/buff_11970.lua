slot2.trigger = {
	"onFire"
}
slot3.index = {
	1
}
slot2.arg_list = {
	countTarget = 10,
	countType = 11970
}
slot1[1] = {
	type = "BattleBuffCount"
}
slot2.trigger = {
	"onBattleBuffCount"
}
slot2.arg_list = {
	quota = 4,
	skill_id = 11970,
	target = "TargetSelf",
	countType = 11970
}
slot1[2] = {
	type = "BattleBuffCastSkill"
}
slot0.effect_list = {}
slot0[1] = {}
slot0[2] = {}
slot0[3] = {}
slot0[4] = {}
slot0[5] = {}
slot0[6] = {}
slot0[7] = {}
slot0[8] = {}
slot0[9] = {}
slot0[10] = {}

return {
	time = 0,
	name = "战意提升",
	init_effect = "",
	id = 11970,
	picture = "",
	desc = "主炮每进行10次攻击，触发增益效果",
	stack = 1,
	color = "red",
	icon = 11970,
	last_effect = ""
}
