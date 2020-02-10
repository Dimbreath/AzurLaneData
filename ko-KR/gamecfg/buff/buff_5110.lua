slot2.trigger = {
	"onAttach"
}
slot2.arg_list = {
	skill_id = 5111,
	target = "TargetSelf"
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {
	""
}
slot3.ship_type_list = {
	6,
	7
}
slot2.arg_list = {
	buff_id = 5112,
	target = "TargetShipTypeFriendly",
	exceptCaster = true
}
slot1[2] = {
	type = "BattleBuffAura"
}
slot2.trigger = {
	""
}
slot2.arg_list = {
	buff_id = 5113,
	target = "TargetPlayerMainFleet"
}
slot1[3] = {
	type = "BattleBuffAura"
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
	name = "航空辅助",
	init_effect = "",
	id = 5110,
	time = 0,
	picture = "",
	desc = "",
	stack = 1,
	color = "yellow",
	icon = 5110,
	last_effect = ""
}
