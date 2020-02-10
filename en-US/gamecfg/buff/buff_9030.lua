slot2.trigger = {
	"onUpdate"
}
slot2.arg_list = {
	skill_id = 9030,
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
	buff_id = 9031,
	target = "TargetSelf",
	time = 10
}
slot1[2] = {
	type = "BattleBuffAddBuff"
}
slot2.trigger = {
	"onUpdate"
}
slot2.arg_list = {
	buff_id = 9032,
	target = "TargetSelf",
	time = 10
}
slot1[3] = {
	type = "BattleBuffAddBuff"
}
slot2.trigger = {
	"onUpdate"
}
slot2.arg_list = {
	count = 0,
	delay = 13
}
slot1[4] = {
	type = "BattleBuffCancelBuff"
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
	name = "",
	init_effect = "",
	id = 9030,
	time = 0,
	picture = "",
	desc = "",
	stack = 1,
	color = "red",
	icon = 9030,
	last_effect = ""
}
