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
	buff_id = 11411,
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
	skill_id = 11410
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
	desc_get = "出击时，编队中每有一个铁血阵营潜艇角色，自身命中、装填属性上升$1，雷击属性上升$2",
	name = "狼群战术-U81",
	init_effect = "",
	id = 11410,
	time = 0,
	picture = "",
	desc = "出击时，编队中每有一个铁血阵营潜艇角色，自身命中、装填属性上升$1，雷击属性上升$2",
	stack = 1,
	color = "red",
	icon = 11410,
	last_effect = ""
}
