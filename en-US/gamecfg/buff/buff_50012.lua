slot2.trigger = {
	"onUpdate"
}
slot2.arg_list = {
	quota = 1,
	time = 6,
	target = "TargetSelf",
	skill_id = 50012
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot0.effect_list = {}

return {
	time = 7,
	name = "敌方维修船维修技能",
	init_effect = "",
	id = 50012,
	picture = "",
	desc = "6秒后回复11%HP，跳转至下一强度",
	stack = 1,
	color = "yellow",
	icon = 50010,
	last_effect = ""
}
