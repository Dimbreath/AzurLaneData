slot2.trigger = {
	"onUpdate"
}
slot2.arg_list = {
	skill_id = 31502,
	time = 30,
	target = "TargetSelf"
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot0.effect_list = {}
slot3.trigger = {
	"onUpdate"
}
slot3.arg_list = {
	skill_id = 31502,
	time = 30,
	target = "TargetSelf"
}
slot2[1] = {
	type = "BattleBuffCastSkill"
}
slot1.effect_list = {}
slot0[1] = {
	desc = "每隔30秒，释放1次技能鱼雷"
}

return {
	time = 0,
	name = "敌人技能鱼雷四联",
	init_effect = "",
	picture = "",
	desc = "每隔30秒，释放1次技能鱼雷",
	stack = 1,
	id = 31502,
	icon = 31502,
	last_effect = ""
}
