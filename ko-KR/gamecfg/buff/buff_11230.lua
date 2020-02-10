slot2.trigger = {
	"onTeammateHpRatioUpdate"
}
slot3.check_target = {
	"TargetPlayerMainFleet",
	"TargetHelpLeastHP"
}
slot2.arg_list = {
	minTargetNumber = 1,
	targetMaxHPRatio = 0.2,
	quota = 1,
	hpUpperBound = 0.2,
	skill_id = 11230
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {}
slot2.arg_list = {
	buff_id = 11232,
	target = "TargetPlayerMainFleet"
}
slot1[2] = {
	type = "BattleBuffAura"
}
slot2.trigger = {
	"onStartGame"
}
slot2.arg_list = {
	skill_id = 11231
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
	desc_get = "",
	name = "吴之雪风",
	init_effect = "",
	id = 11230,
	time = 0,
	picture = "",
	desc = "",
	stack = 1,
	color = "yellow",
	icon = 11230,
	last_effect = ""
}
