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
	buff_id = 3610,
	isBuffStackByCheckTarget = true
}
slot1[1] = {
	type = "BattleBuffAddBuff"
}
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
	skill_id = 3611
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
	desc_get = "出击时，编队中每有一个铁血阵营潜艇角色，自身雷击、装填属性上升$1",
	name = "狼群战术",
	init_effect = "",
	id = 3611,
	time = 0,
	picture = "",
	desc = "出击时，编队中每有一个铁血阵营潜艇角色，自身雷击、装填属性上升$1",
	stack = 1,
	color = "red",
	icon = 3610,
	last_effect = ""
}
