slot2.trigger = {
	"onChargeWeaponFire"
}
slot2.arg_list = {
	skill_id = 60020,
	target = "TargetSelf"
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "测试-萤火虫-幽灵召唤",
	init_effect = "",
	picture = "",
	desc = "召唤一个幽灵",
	stack = 1,
	id = 60035,
	icon = 60035,
	last_effect = "lingxing"
}
