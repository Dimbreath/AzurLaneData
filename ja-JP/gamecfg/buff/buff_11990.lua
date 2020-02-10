slot2.trigger = {
	"onStartGame"
}
slot3.ship_type_list = {
	6,
	7
}
slot2.arg_list = {
	check_target = "TargetShipTypeFriendly",
	buff_id = 11991,
	maxTargetNumber = 1
}
slot1[1] = {
	type = "BattleBuffAddBuff"
}
slot2.trigger = {
	"onAllInStrikeSteady"
}
slot3.ship_type_list = {
	6,
	7
}
slot2.arg_list = {
	check_target = "TargetShipTypeFriendly",
	skill_id = 11990,
	maxTargetNumber = 1
}
slot1[2] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {
	"onAllInStrikeSteady"
}
slot3.ship_type_list = {
	6,
	7
}
slot2.arg_list = {
	minTargetNumber = 2,
	check_target = "TargetShipTypeFriendly",
	maxTargetNumber = 2,
	skill_id = 11992
}
slot1[3] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {
	"onAllInStrikeSteady"
}
slot3.ship_type_list = {
	6,
	7
}
slot2.arg_list = {
	check_target = "TargetShipTypeFriendly",
	skill_id = 11991,
	minTargetNumber = 3
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
	name = "恪尽职守",
	init_effect = "",
	id = 11990,
	time = 0,
	picture = "",
	desc = "",
	stack = 1,
	color = "red",
	icon = 11990,
	last_effect = ""
}
