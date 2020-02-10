slot2.trigger = {
	"onChargeWeaponFire"
}
slot2.arg_list = {
	skill_id = 60019,
	target = "TargetSelf"
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {
	"onChargeWeaponFire"
}
slot2.arg_list = {
	count = 1,
	delay = 3
}
slot1[2] = {
	type = "BattleBuffCancelBuff"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "测试-声望-主炮额外一轮攻击3",
	init_effect = "",
	picture = "",
	desc = "触发:主炮额外一轮攻击3",
	stack = 1,
	id = 60031,
	icon = 60031,
	last_effect = "lingxing"
}
