slot2.trigger = {
	"onAttach"
}
slot3.buff_id_list = {
	6451
}
slot2.arg_list = {}
slot1[1] = {
	type = "BattleBuffCleanse"
}
slot2.trigger = {
	"onAttach",
	"onRemove"
}
slot2.arg_list = {
	number = 0.3,
	type = 23
}
slot1[2] = {
	type = "BattleBuffAddReloadRequirement"
}
slot2.trigger = {
	"onChargeWeaponFire"
}
slot2.arg_list = {
	quota = 1,
	skill_id = 6452,
	target = "TargetSelf"
}
slot1[3] = {
	type = "BattleBuffCastSkill"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "",
	init_effect = "",
	id = 6452,
	picture = "",
	desc = "",
	stack = 1,
	color = "red",
	icon = 6450,
	last_effect = ""
}
