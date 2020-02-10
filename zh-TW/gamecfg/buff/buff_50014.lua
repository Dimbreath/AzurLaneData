slot2.trigger = {
	"onUpdate"
}
slot2.arg_list = {
	skill_id = 50014,
	time = 8,
	target = "TargetSelf"
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "敌方维修船维修技能",
	init_effect = "",
	id = 50014,
	picture = "",
	desc = "每6秒回复15%HP，持续",
	stack = 1,
	color = "yellow",
	icon = 50010,
	last_effect = ""
}
