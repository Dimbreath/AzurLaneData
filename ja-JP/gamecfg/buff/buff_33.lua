slot2.trigger = {
	"onUpdate"
}
slot3.group = {
	id = 30,
	level = 4
}
slot2.arg_list = {
	check_target = "TargetHelpLeastHP",
	skill_id = 33,
	targetMaxHPRatio = 0.99,
	minTargetNumber = 1,
	time = 5,
	target = "TargetSelf"
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot0.effect_list = {}
slot3.trigger = {
	"onUpdate"
}
slot4.group = {
	id = 30,
	level = 4
}
slot3.arg_list = {
	check_target = "TargetHelpLeastHP",
	skill_id = 33,
	targetMaxHPRatio = 0.99,
	minTargetNumber = 1,
	time = 5,
	target = "TargetSelf"
}
slot2[1] = {
	type = "BattleBuffCastSkill"
}
slot1.effect_list = {}
slot0[1] = {
	desc = "每5秒回复20点耐久"
}

return {
	time = 0,
	name = "维修Lv4",
	init_effect = "",
	picture = "",
	desc = "每5秒回复20点耐久",
	stack = 1,
	id = 33,
	icon = 33,
	last_effect = "Health"
}
