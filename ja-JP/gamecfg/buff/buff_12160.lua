slot2.trigger = {
	"onStartGame"
}
slot3.check_target = {
	"TargetAllHelp",
	"TargetNationality"
}
slot2.arg_list = {
	buff_id = 12161,
	minTargetNumber = 4,
	nationality = 2
}
slot1[1] = {
	type = "BattleBuffAddBuff"
}
slot2.trigger = {
	"onStartGame"
}
slot2.arg_list = {
	skill_id = 12161,
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
	desc_get = "",
	name = "日不落的辉光",
	init_effect = "",
	id = 12160,
	time = 0,
	picture = "",
	desc = "",
	stack = 1,
	color = "red",
	icon = 12160,
	last_effect = ""
}
