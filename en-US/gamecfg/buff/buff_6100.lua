slot2.trigger = {
	"onUpdate"
}
slot3.group = {
	id = 6100,
	level = 1
}
slot2.arg_list = {
	check_target = "TargetSelf",
	skill_id = 6100,
	targetMaxHPRatio = 0.99,
	minTargetNumber = 1,
	time = 15,
	target = "TargetSelf"
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "维修工具T1",
	init_effect = "",
	id = 6100,
	picture = "",
	desc = "每15秒0.3%缓慢回复耐久，同类效果取最大值，不可叠加",
	stack = 1,
	color = "yellow",
	icon = 6100,
	last_effect = ""
}
