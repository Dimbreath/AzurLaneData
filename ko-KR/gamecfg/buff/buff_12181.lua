slot2.trigger = {
	"onTeammateHpRatioUpdate"
}
slot3.ship_tag_list = {
	"Bismarck"
}
slot2.arg_list = {
	minTargetNumber = 1,
	skill_id = 12181,
	check_target = "TargetShipTag",
	quota = 1,
	hpUpperBound = 0.2,
	target = "TargetSelf"
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {
	"onTeammateHpRatioUpdate"
}
slot3.ship_tag_list = {
	"Bismarck"
}
slot2.arg_list = {
	check_target = "TargetShipTag",
	skill_id = 12180,
	hpUpperBound = 0.2,
	quota = 1,
	maxTargetNumber = 0,
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
	desc_get = "当队友耐久低于20%时，发射一轮弹幕",
	name = "誓言之光",
	init_effect = "",
	id = 12181,
	time = 0,
	picture = "",
	desc = "当队友耐久低于20%时，发射一轮弹幕",
	stack = 1,
	color = "blue",
	icon = 12180,
	last_effect = ""
}
