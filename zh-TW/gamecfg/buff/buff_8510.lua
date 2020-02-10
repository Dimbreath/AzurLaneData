slot2.trigger = {
	"onUpdate"
}
slot2.arg_list = {
	time = 1.5,
	target = "TargetSelf",
	maxHPRatio = 0.02
}
slot1[1] = {
	type = "BattleBuffHOT"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "治疗光环",
	init_effect = "",
	picture = "",
	desc = "治疗光环-治疗",
	stack = 1,
	id = 8510,
	icon = 8510,
	last_effect = "Health"
}
