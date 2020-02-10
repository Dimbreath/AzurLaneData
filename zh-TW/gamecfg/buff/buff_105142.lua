slot0.blink = {
	1,
	0,
	0,
	0.3,
	0.3
}
slot2.trigger = {
	"onAttach"
}
slot3.buff_id_list = {
	105141
}
slot2.arg_list = {}
slot1[1] = {
	type = "BattleBuffCleanse"
}
slot2.trigger = {
	"onAllInStrikeSteady"
}
slot2.arg_list = {
	quota = 1,
	skill_id = 105140,
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
	name = "野性的二元论",
	init_effect = "jinengchufared",
	id = 105142,
	time = 0,
	picture = "",
	desc = "",
	stack = 1,
	color = "red",
	icon = 105140,
	last_effect = ""
}
