slot2.trigger = {
	"onStartGame"
}
slot3.ship_type_list = {
	6,
	7
}
slot2.arg_list = {
	minTargetNumber = 1,
	buff_id = 11861,
	check_target = "TargetShipTypeFriendly",
	isBuffStackByCheckTarget = true
}
slot1[1] = {
	type = "BattleBuffAddBuff"
}
slot2.trigger = {
	"onStartGame"
}
slot3.ship_type_list = {
	6,
	7
}
slot2.arg_list = {
	check_target = "TargetShipTypeFriendly",
	skill_id = 11860,
	minTargetNumber = 1
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
	desc_get = "",
	name = "苍狼之印",
	init_effect = "",
	id = 11860,
	time = 0,
	picture = "",
	desc = "",
	stack = 1,
	color = "yellow",
	icon = 11860,
	last_effect = ""
}
