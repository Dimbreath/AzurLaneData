slot2.trigger = {
	"onTorpedoWeaponFire"
}
slot2.arg_list = {
	rant = 10000,
	skill_id = 7029,
	target = "TargetSelf",
	time = 20
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "鱼雷连射",
	init_effect = "",
	picture = "",
	desc = "第二章敌人鱼雷连射2轮-4发鱼雷",
	stack = 1,
	id = 7029,
	icon = 7029,
	last_effect = ""
}
