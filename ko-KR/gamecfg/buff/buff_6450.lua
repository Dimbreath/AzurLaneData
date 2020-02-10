slot2.trigger = {
	"onAttach"
}
slot3.buff_id_list = {
	6452
}
slot2.arg_list = {}
slot1[1] = {
	type = "BattleBuffCleanse"
}
slot2.trigger = {
	"onChargeWeaponFire"
}
slot2.arg_list = {
	quota = 1,
	skill_id = 6450,
	target = "TargetSelf"
}
slot1[2] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {
	"onStartGame"
}
slot2.arg_list = {
	buff_id = 6453,
	target = "TargetSelf"
}
slot1[3] = {
	type = "BattleBuffAddBuff"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "",
	init_effect = "",
	id = 6450,
	picture = "",
	desc = "",
	stack = 1,
	color = "red",
	icon = 6450,
	last_effect = ""
}
