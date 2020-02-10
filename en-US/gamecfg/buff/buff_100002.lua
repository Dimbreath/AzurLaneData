slot2.trigger = {
	"onAttach",
	"onRemove"
}
slot2.arg_list = {
	weapon_id = 311067
}
slot1[1] = {
	type = "BattleBuffNewWeapon"
}
slot2.trigger = {
	"onAttach",
	"onRemove"
}
slot2.arg_list = {
	weapon_id = 311068
}
slot1[2] = {
	type = "BattleBuffNewWeapon"
}
slot2.trigger = {
	"onHPRatioUpdate"
}
slot2.arg_list = {
	count = 1,
	hpUpperBound = 0.8
}
slot1[3] = {
	type = "BattleBuffCancelBuff"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "第一阶段",
	init_effect = "",
	picture = "",
	desc = "第一阶段开始",
	stack = 1,
	id = 100002,
	icon = 100002,
	last_effect = ""
}
