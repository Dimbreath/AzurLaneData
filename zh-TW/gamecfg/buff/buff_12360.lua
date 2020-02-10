slot2.trigger = {
	"onStartGame"
}
slot3.check_target = {
	"TargetPlayerVanguardFleet",
	"TargetShipTypeFriendly"
}
slot3.ship_type_list = {
	1
}
slot2.arg_list = {
	minTargetNumber = 1,
	target = "TargetSelf",
	skill_id = 12360
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {
	"onStartGame"
}
slot2.arg_list = {
	skill_id = 12361,
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
	name = "爱丽丝",
	init_effect = "",
	id = 12360,
	time = 0,
	picture = "",
	desc = "",
	stack = 1,
	color = "red",
	icon = 12360,
	last_effect = ""
}
