slot2.trigger = {
	"onUpdate"
}
slot2.arg_list = {
	minTargetNumber = 1,
	range = 25,
	check_target = "TargetHarmNearest",
	quota = 1,
	skill_id = 40000
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "指挥喵触发特殊弹幕",
	init_effect = "",
	id = 40001,
	picture = "",
	desc = "该入口提供战外挂载到战内",
	stack = 1,
	color = "yellow",
	icon = 40000,
	last_effect = ""
}
