slot2.trigger = {
	"onUpdate"
}
slot2.arg_list = {
	skill_id = 60026,
	time = 25,
	target = "TargetSelf"
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {
	"onBulletCreate"
}
slot2.arg_list = {
	skill_id = 60027,
	bulletTrigger = "onBombBulletBang",
	target = "TargetSelf"
}
slot1[2] = {
	type = "BattleBuffCastSkill"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "测试-随机技能-召唤地狱火",
	init_effect = "",
	picture = "",
	desc = "召唤地狱火",
	stack = 1,
	id = 60047,
	icon = 60047,
	last_effect = ""
}
