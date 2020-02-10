slot0.blink = {
	1,
	0,
	0,
	0.3,
	0.3
}
slot2.trigger = {
	"onAttach",
	"onStack"
}
slot3.buff_id_list = {
	12192
}
slot2.arg_list = {}
slot1[1] = {
	type = "BattleBuffCleanse"
}
slot2.trigger = {
	"onAttach",
	"onStack"
}
slot3.buff_id_list = {
	12193
}
slot2.arg_list = {}
slot1[2] = {
	type = "BattleBuffCleanse"
}
slot2.trigger = {
	"onAttach",
	"onStack"
}
slot2.arg_list = {
	skill_id = 12191,
	target = "TargetSelf"
}
slot1[3] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {
	"onAttach",
	"onStack"
}
slot2.arg_list = {
	buff_id = 12192,
	target = "TargetSelf"
}
slot1[4] = {
	type = "BattleBuffAddBuff"
}
slot0.effect_list = {}

return {
	name = "",
	init_effect = "jinengchufared",
	time = 0,
	picture = "",
	desc = "属性提升",
	stack = 1,
	id = 12194,
	icon = 12190,
	last_effect = ""
}
