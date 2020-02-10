slot2.trigger = {
	"onStartGame"
}
slot2.arg_list = {
	buff_id = 11801
}
slot1[1] = {
	type = "BattleBuffAddBuff"
}
slot2.trigger = {
	"onStartGame"
}
slot2.arg_list = {
	check_target = "TargetNationalityFriendly",
	buff_id = 11802,
	minTargetNumber = 4,
	nationality = 3
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
	name = "克敌机先",
	init_effect = "",
	id = 11800,
	time = 0,
	picture = "",
	desc = "",
	stack = 1,
	color = "red",
	icon = 11800,
	last_effect = ""
}
