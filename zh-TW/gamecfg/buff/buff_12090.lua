slot2.trigger = {
	"onUpdate"
}
slot2.arg_list = {
	skill_id = 12090,
	target = "TargetSelf",
	time = 24
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {
	"onUpdate"
}
slot2.arg_list = {
	buff_id = 12091,
	target = "TargetSelf",
	time = 8,
	quota = 1
}
slot1[2] = {
	type = "BattleBuffAddBuff"
}
slot2.trigger = {
	"onStartGame"
}
slot3.index = {
	3
}
slot3.type = {
	2
}
slot2.arg_list = {
	minWeaponNumber = 1,
	check_weapon = true,
	skill_id = 12093
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
	name = "小齐柏林1",
	init_effect = "",
	id = 12090,
	picture = "",
	desc = "",
	stack = 1,
	color = "red",
	icon = 12090,
	last_effect = ""
}
