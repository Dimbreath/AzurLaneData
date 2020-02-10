slot2.trigger = {
	"onSubmarineRaid"
}
slot2.arg_list = {
	skill_id = 12470,
	target = "TargetSelf"
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {
	"onSubmarineRaid"
}
slot3.ship_tag_list = {
	"Albacore"
}
slot2.arg_list = {
	check_target = "TargetShipTag",
	buff_id = 12472,
	maxTargetNumber = 0,
	target = "TargetSelf"
}
slot1[2] = {
	type = "BattleBuffAddBuff"
}
slot2.trigger = {
	"onSubmarineRaid"
}
slot3.ship_tag_list = {
	"Albacore"
}
slot2.arg_list = {
	check_target = "TargetShipTag",
	minTargetNumber = 1,
	buff_id = 12473,
	target = "TargetSelf"
}
slot1[3] = {
	type = "BattleBuffAddBuff"
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
	name = "棘鳍弹幕",
	init_effect = "",
	id = 12470,
	time = 0,
	picture = "",
	desc = "",
	stack = 1,
	color = "red",
	icon = 12470,
	last_effect = ""
}
