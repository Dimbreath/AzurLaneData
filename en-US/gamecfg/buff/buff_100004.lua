slot2.trigger = {
	"onAttach",
	"onRemove"
}
slot2.arg_list = {
	weapon_id = 311077
}
slot1[1] = {
	type = "BattleBuffNewWeapon"
}
slot2.trigger = {
	"onAttach",
	"onRemove"
}
slot2.arg_list = {
	weapon_id = 311078
}
slot1[2] = {
	type = "BattleBuffNewWeapon"
}
slot2.trigger = {
	"onHPRatioUpdate"
}
slot2.arg_list = {
	count = 1,
	hpUpperBound = 0.2
}
slot1[3] = {
	type = "BattleBuffCancelBuff"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "第三阶段",
	init_effect = "",
	picture = "",
	desc = "第三阶段开始",
	stack = 1,
	id = 100004,
	icon = 100004,
	last_effect = ""
}
