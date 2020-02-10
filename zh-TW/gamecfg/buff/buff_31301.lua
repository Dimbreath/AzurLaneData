slot2.trigger = {
	"onUpdate"
}
slot2.arg_list = {
	skill_id = 31301,
	time = 10,
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
	skill_id = 31301,
	time = 10,
	target = "TargetSelf"
}
slot2[1] = {
	type = "BattleBuffCastSkill"
}
slot1.effect_list = {}
slot0[1] = {
	desc = "每隔10秒，释放1次技能弹幕"
}

return {
	time = 0,
	name = "重樱敌人技能弹幕I",
	init_effect = "",
	picture = "",
	desc = "每隔10秒，释放1次技能弹幕",
	stack = 1,
	id = 31301,
	icon = 31301,
	last_effect = ""
}
