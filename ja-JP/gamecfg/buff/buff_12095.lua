slot2.trigger = {
	"onAttach"
}
slot3.buff_id_list = {
	12090
}
slot2.arg_list = {}
slot1[1] = {
	type = "BattleBuffCleanse"
}
slot2.trigger = {
	"onUpdate"
}
slot2.arg_list = {
	skill_id = 12092,
	target = "TargetSelf",
	time = 32
}
slot1[2] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {
	"onUpdate"
}
slot2.arg_list = {
	buff_id = 12091,
	target = "TargetSelf",
	time = 8,
	quota = 1
}
slot1[3] = {
	type = "BattleBuffAddBuff"
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
	name = "小齐柏林1",
	init_effect = "",
	id = 12093,
	picture = "",
	desc = "副炮",
	stack = 1,
	color = "red",
	icon = 12090,
	last_effect = ""
}
