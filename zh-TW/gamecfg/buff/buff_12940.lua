slot2.trigger = {
	"onStartGame"
}
slot2.arg_list = {
	minTargetNumber = 1,
	buff_id = 12941,
	check_target = "TargetNationalityFriendly",
	nationality = 2,
	isBuffStackByCheckTarget = true
}
slot1[1] = {
	type = "BattleBuffAddBuff"
}
slot2.trigger = {
	"onStartGame"
}
slot2.arg_list = {
	check_target = "TargetNationalityFriendly",
	minTargetNumber = 1,
	skill_id = 12940,
	nationality = 2
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
	name = "黛朵2",
	init_effect = "",
	id = 12940,
	time = 0,
	picture = "",
	desc = "",
	stack = 1,
	color = "yellow",
	icon = 12940,
	last_effect = ""
}
