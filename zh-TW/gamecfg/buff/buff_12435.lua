slot1[1] = SYSTEM_SCENARIO
slot1[2] = SYSTEM_ROUTINE
slot1[3] = SYSTEM_SHAM
slot1[4] = SYSTEM_CHALLENGE
slot1[5] = SYSTEM_ACT_BOSS
slot0.limit = {}
slot2.trigger = {
	"onStartGame"
}
slot2.arg_list = {
	skill_id = 12430,
	target = "TargetSelf"
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {
	"onUpdate"
}
slot2.arg_list = {
	buff_id = 12436,
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
	name = "Lucky A",
	init_effect = "",
	id = 12435,
	time = 0,
	picture = "",
	desc = "",
	stack = 1,
	color = "red",
	icon = 12430,
	last_effect = ""
}
