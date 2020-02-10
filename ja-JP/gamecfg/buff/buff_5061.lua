slot2.trigger = {
	"onStartGame"
}
slot3.ship_type_list = {
	2,
	3,
	9,
	11,
	18
}
slot2.arg_list = {
	check_target = "TargetShipTypeFriendly",
	quota = 1,
	maxTargetNumber = 1,
	skill_id = 5060
}
slot1[1] = {
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
	desc_get = "出击时，队伍其他先锋都为驱逐舰角色时，自身航速提高4，对驱逐舰和轻巡洋舰造成的伤害提高$1",
	name = "驱逐编队",
	init_effect = "",
	id = 5061,
	time = 0,
	picture = "",
	desc = "出击时，队伍其他先锋都为驱逐舰角色时，自身航速提高4，对驱逐舰和轻巡洋舰造成的伤害提高$1",
	stack = 1,
	color = "yellow",
	icon = 5060,
	last_effect = ""
}
