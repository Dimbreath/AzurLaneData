slot2.trigger = {
	"onSubmarineRaid"
}
slot3.check_target = {
	"TargetNationalityFriendly",
	"TargetShipTypeFriendly"
}
slot3.ship_type_list = {
	8
}
slot2.arg_list = {
	minTargetNumber = 1,
	nationality = 4,
	buff_id = 12411,
	isBuffStackByCheckTarget = true
}
slot1[1] = {
	type = "BattleBuffAddBuff"
}
slot2.trigger = {
	"onSubmarineRaid"
}
slot2.arg_list = {
	skill_id = 12410
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
	name = "狼群战术-U101",
	init_effect = "",
	id = 12410,
	time = 0,
	picture = "",
	desc = "",
	stack = 1,
	color = "blue",
	icon = 12410,
	last_effect = ""
}
