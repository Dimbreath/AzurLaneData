slot2.trigger = {
	"onStartGame"
}
slot3.ship_type_list = {
	1,
	2,
	3,
	4,
	5,
	6,
	7,
	9,
	10,
	11,
	12,
	13,
	18
}
slot2.arg_list = {
	minTargetNumber = 6,
	check_target = "TargetShipTypeFriendly",
	quota = 1,
	skill_id = 11070
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot0.effect_list = {}
slot0[1] = {
	desc = "太原技能"
}
slot0[2] = {
	desc = "太原技能"
}
slot0[3] = {
	desc = "太原技能"
}
slot0[4] = {
	desc = "太原技能"
}
slot0[5] = {
	desc = "太原技能"
}
slot0[6] = {
	desc = "太原技能"
}
slot0[7] = {
	desc = "太原技能"
}
slot0[8] = {
	desc = "太原技能"
}
slot0[9] = {
	desc = "太原技能"
}
slot0[10] = {
	desc = "太原技能"
}

return {
	desc_get = "出击时，若队伍中舰娘编队为满员6人，自身炮击、装填提高10%（25%），机动提高4%（10%）",
	name = "太原技能",
	init_effect = "",
	id = 11070,
	time = 0,
	picture = "",
	desc = "出击时，若队伍中舰娘编队为满员6人，自身炮击、装填提高10%（25%），机动提高4%（10%）",
	stack = 1,
	color = "yellow",
	icon = 11070,
	last_effect = ""
}
