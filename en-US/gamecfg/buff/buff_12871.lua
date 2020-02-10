slot2.trigger = {
	"onAttach"
}
slot3.ship_tag_list = {
	"ryuhou"
}
slot2.arg_list = {
	buff_id = 12874,
	target = "TargetShipTag"
}
slot1[1] = {
	type = "BattleBuffAddBuff"
}
slot2.trigger = {
	"onSubmarineRaid"
}
slot2.arg_list = {
	skill_id = 12871,
	target = "TargetSelf"
}
slot1[2] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {
	"onFoeDying"
}
slot3.ship_tag_list = {
	"ryuhou"
}
slot2.arg_list = {
	skill_id = 12872,
	target = "TargetShipTag",
	killer = "self"
}
slot1[3] = {
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
	time = 0,
	name = "龙凤2",
	init_effect = "",
	id = 12871,
	picture = "",
	desc = "",
	stack = 1,
	color = "yellow",
	icon = 12870,
	last_effect = ""
}
