slot2.trigger = {
	"onAttach"
}
slot3.check_target = {
	"TargetSelf",
	"TargetShipTag"
}
slot3.ship_tag_list = {
	"The-Four-Symbols"
}
slot2.arg_list = {
	target = "TargetSelf",
	maxTargetNumber = 0,
	skill_id = 24012
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {
	"onAttach"
}
slot3.check_target = {
	"TargetSelf",
	"TargetShipTag"
}
slot3.ship_tag_list = {
	"The-Four-Symbols"
}
slot2.arg_list = {
	buff_id = 24014,
	minTargetNumber = 1,
	target = "TargetSelf"
}
slot1[2] = {
	type = "BattleBuffAddBuff"
}
slot0.effect_list = {}
slot0[1] = {}

return {
	time = 3,
	name = "",
	init_effect = "",
	id = 24016,
	picture = "",
	desc = "",
	stack = 1,
	color = "red",
	icon = 20000,
	last_effect = ""
}
