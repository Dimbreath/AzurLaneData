slot0.blink = {
	1,
	0,
	0,
	0.3,
	0.3
}
slot2.trigger = {
	"onAttach"
}
slot2.arg_list = {
	number = 0.3,
	attr = "dodgeRateExtra"
}
slot1[1] = {
	type = "BattleBuffAddAttrRatio"
}
slot2.trigger = {
	"onAttach"
}
slot2.arg_list = {
	number = -0.2,
	attr = "injureRatio"
}
slot1[2] = {
	type = "BattleBuffAddAttrRatio"
}
slot0.effect_list = {}

return {
	name = "属性变更",
	init_effect = "jinengchufared",
	time = 0,
	picture = "",
	desc = "免伤,回避率提升",
	stack = 1,
	id = 9011,
	icon = 9011,
	last_effect = ""
}
