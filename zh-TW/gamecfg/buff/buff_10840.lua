slot2.trigger = {
	"onFriendlyShipDying"
}
slot3.ship_type_list = {
	1,
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
	skill_id = 10840
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot0.effect_list = {}
slot0[1] = {
	desc = "决死突袭"
}
slot0[2] = {
	desc = "决死突袭"
}
slot0[3] = {
	desc = "决死突袭"
}
slot0[4] = {
	desc = "决死突袭"
}
slot0[5] = {
	desc = "决死突袭"
}
slot0[6] = {
	desc = "决死突袭"
}
slot0[7] = {
	desc = "决死突袭"
}
slot0[8] = {
	desc = "决死突袭"
}
slot0[9] = {
	desc = "决死突袭"
}
slot0[10] = {
	desc = "决死突袭"
}

return {
	desc_get = "当由于战斗减员导致自身成为先锋仅存的角色时，自身伤害提高50.0%，受到伤害提高20.0%",
	name = "决死突袭",
	init_effect = "",
	id = 10840,
	time = 0,
	picture = "",
	desc = "当由于战斗减员导致自身成为先锋仅存的角色时，自身伤害提高50.0%，受到伤害提高20.0%",
	stack = 1,
	color = "red",
	icon = 10840,
	last_effect = ""
}
