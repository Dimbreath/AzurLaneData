slot2.trigger = {
	"onAttach"
}
slot3.ship_type_list = {
	1
}
slot2.arg_list = {
	minTargetNumber = 1,
	check_target = "TargetShipType",
	target = "TargetSelf",
	skill_id = 40150
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "先锋舰队只有一艘舰船且为驱逐舰时，战斗力大幅提升，依据指挥属性",
	init_effect = "",
	id = 40152,
	picture = "",
	desc = "该入口提供战外挂载到战内",
	stack = 1,
	color = "yellow",
	icon = 40150,
	last_effect = ""
}
