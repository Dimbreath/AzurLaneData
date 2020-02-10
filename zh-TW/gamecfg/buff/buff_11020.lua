slot2.trigger = {
	"onStartGame"
}
slot3.check_target = {
	"TargetNationalityFriendly",
	"TargetShipTypeFriendly"
}
slot3.ship_type_list = {
	4,
	5,
	6,
	7,
	9,
	10,
	12,
	13
}
slot2.arg_list = {
	minTargetNumber = 1,
	nationality = 2,
	buff_id = 11021,
	target = "TargetSelf"
}
slot1[1] = {
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
	desc_get = "当队伍后排有皇家阵营角色时，空袭时有30%(满级50%)機率触发，使用海喷火进行额外一轮航空攻击",
	name = "胡蜂双蛰",
	init_effect = "",
	id = 11020,
	time = 0,
	picture = "",
	desc = "当队伍后排有皇家阵营角色时，空袭时有$1機率触发，使用海喷火进行额外一轮航空攻击",
	stack = 1,
	color = "red",
	icon = 11020,
	last_effect = ""
}
