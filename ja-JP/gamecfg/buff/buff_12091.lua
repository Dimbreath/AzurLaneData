slot2.trigger = {
	"onUpdate"
}
slot2.arg_list = {
	quota = 1,
	target = "TargetSelf",
	time = 8,
	skill_id = 12091
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {
	"onAttach"
}
slot2.arg_list = {
	quota = 1,
	skill_id = 12091,
	target = "TargetSelf"
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
	time = 22,
	name = "小齐柏林1",
	init_effect = "",
	id = 12091,
	picture = "",
	desc = "",
	stack = 1,
	color = "red",
	icon = 12090,
	last_effect = ""
}
