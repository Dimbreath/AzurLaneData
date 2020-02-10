slot2.trigger = {
	"onStartGame"
}
slot2.arg_list = {
	skill_id = 5101
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {
	"onUpdate"
}
slot2.arg_list = {
	quota = 3,
	time = 12,
	target = "TargetSelf",
	skill_id = 5102
}
slot1[2] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {
	"onRemove"
}
slot3.buff_id_list = {
	5102
}
slot2.arg_list = {}
slot1[3] = {
	type = "BattleBuffCleanse"
}
slot2.trigger = {
	"onRemove"
}
slot2.arg_list = {
	skill_id = 5103,
	target = "TargetSelf"
}
slot1[4] = {
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
	name = "应急战备",
	init_effect = "",
	id = 5101,
	time = 36,
	picture = "",
	desc = "",
	stack = 1,
	color = "yellow",
	icon = 5100,
	last_effect = ""
}
