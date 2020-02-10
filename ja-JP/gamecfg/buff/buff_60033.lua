slot2.trigger = {
	"onChargeWeaponFire"
}
slot2.arg_list = {
	skill_id = 60017,
	target = "TargetSelf"
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {
	"onChargeWeaponBulletCreate"
}
slot2.arg_list = {
	buff_id = 60032,
	bulletTrigger = "onBulletKill",
	target = "TargetSelf"
}
slot1[2] = {
	type = "BattleBuffAddBuff"
}
slot2.trigger = {
	"onChargeWeaponFire"
}
slot2.arg_list = {
	count = 1,
	delay = 3
}
slot1[3] = {
	type = "BattleBuffCancelBuff"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "测试-声望-主炮额外一轮攻击1",
	init_effect = "",
	picture = "",
	desc = "触发:主炮额外一轮攻击1",
	stack = 1,
	id = 60033,
	icon = 60033,
	last_effect = "lingxing"
}
