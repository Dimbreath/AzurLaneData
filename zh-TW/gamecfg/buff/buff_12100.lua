slot2.trigger = {
	"onStartGame"
}
slot2.arg_list = {
	minTargetNumber = 1,
	buff_id = 12101,
	check_target = "TargetNationalityFriendly",
	nationality = 4,
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
	skill_id = 12100,
	nationality = 4
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
	desc_get = "出击时，队友中每有一个铁血角色，自身航空、防空、装填属性上升1.0%(满级5.0%)",
	name = "铁血第一航母",
	init_effect = "",
	id = 12100,
	time = 0,
	picture = "",
	desc = "出击时，队友中每有一个铁血角色，自身航空、防空、装填属性上升$1",
	stack = 1,
	color = "yellow",
	icon = 12100,
	last_effect = ""
}
