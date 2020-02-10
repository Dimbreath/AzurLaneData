slot2.trigger = {
	"onStartGame"
}
slot3.ship_type_list = {
	1
}
slot2.arg_list = {
	minTargetNumber = 1,
	buff_id = 101041,
	check_target = "TargetShipTypeFriendly",
	isBuffStackByCheckTarget = true
}
slot1[1] = {
	type = "BattleBuffAddBuff"
}
slot2.trigger = {
	"onStartGame"
}
slot3.ship_type_list = {
	1
}
slot2.arg_list = {
	check_target = "TargetShipTypeFriendly",
	skill_id = 101040,
	minTargetNumber = 1
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
	desc_get = "队伍中每有1艘驱逐舰，受到炮击伤害降低，装填速度提高",
	name = "联结·阿萨姆",
	init_effect = "",
	id = 101040,
	time = 0,
	picture = "",
	desc = "队伍中每有1艘驱逐舰，受到炮击伤害降低，装填速度提高",
	stack = 1,
	color = "blue",
	icon = 101040,
	last_effect = ""
}
