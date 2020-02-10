slot2.trigger = {}
slot2.arg_list = {
	buff_id = 12001,
	shipType = 6,
	target = "TargetPlayerByType"
}
slot1[1] = {
	type = "BattleBuffAura"
}
slot2.trigger = {}
slot2.arg_list = {
	buff_id = 12001,
	shipType = 7,
	target = "TargetPlayerByType"
}
slot1[2] = {
	type = "BattleBuffAura"
}
slot2.trigger = {
	"onStartGame"
}
slot2.arg_list = {
	skill_id = 12000
}
slot1[3] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {
	"onStartGame"
}
slot3.targetTemplateIDList = {
	101051,
	101052,
	101053,
	101054
}
slot2.arg_list = {
	check_target = "TargetTemplate",
	minTargetNumber = 1,
	skill_id = 12001,
	target = "TargetSelf"
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
	desc_get = "在队伍中(存活)时降低轻母、航母受到的伤害",
	name = "远东的羁绊",
	init_effect = "",
	id = 12000,
	time = 0,
	picture = "",
	desc = "队伍中(存活)时降低轻母、航母受到的伤害$1",
	stack = 1,
	color = "yellow",
	icon = 12000,
	last_effect = ""
}
