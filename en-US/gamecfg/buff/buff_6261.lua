slot2.trigger = {
	"onAttach",
	"onRemove"
}
slot2.arg_list = {
	number = -0.15,
	type = 23
}
slot1[1] = {
	type = "BattleBuffAddReloadRequirement"
}
slot2.trigger = {
	"onChargeWeaponReady"
}
slot2.arg_list = {
	count = 1
}
slot1[2] = {
	type = "BattleBuffCancelBuff"
}
slot0.effect_list = {}

return {
	time = 50,
	name = "精确锁定",
	init_effect = "",
	picture = "",
	desc = "准备速度略微提高",
	stack = 1,
	id = 6261,
	icon = 6261,
	last_effect = ""
}
