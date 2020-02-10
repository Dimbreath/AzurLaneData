slot2.trigger = {
	"onTeammateHpRatioUpdate"
}
slot3.check_target = {
	"TargetAllHelp",
	"TargetPlayerVanguardFleet",
	"TargetHelpLeastHP"
}
slot2.arg_list = {
	skill_id = 11480,
	targetMaxHPRatio = 0.2,
	minTargetNumber = 1,
	exceptCaster = true,
	hpUpperBound = 0.2,
	target = "TargetSelf",
	quota = 1
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {
	"onUpdate"
}
slot2.arg_list = {
	buff_id = 11484,
	time = 20,
	target = "TargetSelf"
}
slot1[2] = {
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
	name = "",
	init_effect = "",
	id = 11480,
	time = 0,
	picture = "",
	desc = "",
	stack = 1,
	color = "blue",
	icon = 11480,
	last_effect = ""
}
