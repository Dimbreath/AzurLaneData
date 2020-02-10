slot2.trigger = {
	"onFlagShip"
}
slot3.check_target = {
	"TargetPlayerFlagShip",
	"TargetShipType"
}
slot3.ship_type_list = {
	4,
	5,
	10
}
slot2.arg_list = {
	minTargetNumber = 1,
	quota = 1,
	skill_id = 40220
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "",
	init_effect = "",
	id = 40220,
	picture = "",
	desc = "该入口提供战外挂载到战内",
	stack = 1,
	color = "yellow",
	icon = 40220,
	last_effect = ""
}
