slot2.trigger = {
	"onAttach"
}
slot2.arg_list = {
	quota = 1,
	skill_id = 105050,
	target = "TargetSelf"
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {
	"onSubmarineRaid"
}
slot2.arg_list = {
	skill_id = 105051,
	target = "TargetSelf"
}
slot1[2] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {
	"onSubmarineRetreat"
}
slot2.arg_list = {
	skill_id = 105052,
	target = "TargetSelf"
}
slot1[3] = {
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
	name = "室内系女仆",
	init_effect = "",
	id = 105050,
	picture = "",
	desc = "氧气存量降低，造成伤害提高",
	stack = 1,
	color = "red",
	icon = 105050,
	last_effect = ""
}
