slot2.trigger = {
	"onLeader"
}
slot2.arg_list = {
	buff_id = 19181,
	target = "TargetSelf"
}
slot1[1] = {
	type = "BattleBuffAddBuff"
}
slot2.trigger = {
	"onBulletCollide"
}
slot3.index = {
	2
}
slot2.arg_list = {
	countTarget = 10,
	countType = 19180
}
slot1[2] = {
	type = "BattleBuffCount"
}
slot2.trigger = {
	"onBattleBuffCount"
}
slot2.arg_list = {
	skill_id = 19180,
	target = "TargetSelf",
	countType = 19180
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
	name = "北风2",
	init_effect = "",
	id = 19180,
	time = 0,
	picture = "",
	desc = "",
	stack = 1,
	color = "red",
	icon = 19180,
	last_effect = ""
}
