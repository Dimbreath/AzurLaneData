slot2.trigger = {
	"onUpdate"
}
slot2.arg_list = {
	skill_id = 11871,
	target = "TargetSelf",
	time = 10
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {
	"onUpdate"
}
slot2.arg_list = {
	buff_id = 11872,
	target = "TargetSelf",
	time = 10
}
slot1[2] = {
	type = "BattleBuffAddBuff"
}
slot2.trigger = {
	"onStartGame"
}
slot2.arg_list = {
	skill_id = 11872
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
	desc_get = "",
	name = "神射手·改",
	init_effect = "",
	id = 11870,
	time = 15,
	picture = "",
	desc = "",
	stack = 1,
	color = "red",
	icon = 11870,
	last_effect = ""
}
