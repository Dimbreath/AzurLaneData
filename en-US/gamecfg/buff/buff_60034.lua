slot2.trigger = {
	"onBulletKill"
}
slot2.arg_list = {
	buff_id = 60033,
	target = "TargetSelf"
}
slot1[1] = {
	type = "BattleBuffAddBuff"
}
slot2.trigger = {
	"onBulletKill"
}
slot2.arg_list = {
	skill_id = 60016,
	target = "TargetSelf"
}
slot1[2] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {
	"onBulletKill"
}
slot2.arg_list = {
	weapon = "ChargeWeapon"
}
slot1[3] = {
	type = "BattleBuffWeaponCoolDown"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "测试-声望-战神-被动触发",
	init_effect = "",
	picture = "",
	desc = "触发:主炮额外一轮攻击1",
	stack = 1,
	id = 60034,
	icon = 60034,
	last_effect = "lingxing"
}
