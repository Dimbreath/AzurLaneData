slot2.trigger = {
	"onAttach"
}
slot3.ship_tag_list = {
	"KizunaAI"
}
slot2.arg_list = {
	buff_id = 104032,
	minTargetNumber = 2,
	check_target = "TargetShipTag",
	isBuffStackByCheckTarget = true,
	target = "TargetSelf"
}
slot1[1] = {
	type = "BattleBuffAddBuff"
}
slot2.trigger = {
	"onAttach"
}
slot3.ship_tag_list = {
	"KizunaAI"
}
slot2.arg_list = {
	check_target = "TargetShipTag",
	skill_id = 104031,
	maxTargetNumber = 1,
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
	time = 0,
	name = "连接着的羁绊",
	init_effect = "",
	id = 104031,
	picture = "",
	desc = "连接着的羁绊-检测TAG",
	stack = 1,
	color = "yellow",
	icon = 104030,
	last_effect = ""
}
