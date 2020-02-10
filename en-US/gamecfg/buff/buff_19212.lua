slot2.trigger = {
	"onFire"
}
slot3.index = {
	1
}
slot2.arg_list = {
	countTarget = 4,
	countType = 19212
}
slot1[1] = {
	type = "BattleBuffCount"
}
slot2.trigger = {
	"onAttach"
}
slot2.arg_list = {
	buff_id = 19213,
	target = "TargetSelf"
}
slot1[2] = {
	type = "BattleBuffAddBuff"
}
slot2.trigger = {
	"onBattleBuffCount"
}
slot2.arg_list = {
	minTargetNumber = 1,
	range = 30,
	check_target = "TargetHarmNearest",
	countType = 19212,
	skill_id = 19213,
	target = "TargetSelf"
}
slot1[3] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {
	"onBattleBuffCount"
}
slot2.arg_list = {
	check_target = "TargetHarmNearest",
	range = 30,
	skill_id = 19214,
	countType = 19212,
	maxTargetNumber = 0,
	target = "TargetSelf"
}
slot1[4] = {
	type = "BattleBuffCastSkill"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "吾妻特殊弹幕II",
	init_effect = "",
	id = 19212,
	picture = "",
	desc = "吾妻特殊弹幕II",
	stack = 1,
	color = "red",
	icon = 19210,
	last_effect = ""
}
