slot2.trigger = {
	"onHPRatioUpdate"
}
slot3.check_target = {
	"TargetShipTag"
}
slot3.ship_tag_list = {
	"AR-1"
}
slot2.arg_list = {
	skill_id = 50110,
	minTargetNumber = 1,
	hpUpperBound = 0.8,
	target = "TargetSelf"
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "可被维修目标·监控自身血量",
	init_effect = "",
	picture = "",
	desc = "",
	stack = 1,
	id = 50110,
	icon = 50110,
	last_effect = ""
}
