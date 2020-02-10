slot2.trigger = {
	"onChargeWeaponBulletCreate"
}
slot2.arg_list = {
	skill_id = 60024,
	bulletTrigger = "onBulletHit",
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
	delay = 7
}
slot1[2] = {
	type = "BattleBuffCancelBuff"
}
slot2.trigger = {
	"onBulletHit"
}
slot2.arg_list = {
	count = 50
}
slot1[3] = {
	type = "BattleBuffCancelBuff"
}
slot0.effect_list = {}

return {
	time = 10,
	name = "测试-随机技能-棱镜光束-发射",
	init_effect = "",
	picture = "",
	desc = "棱镜光束",
	stack = 1,
	id = 60043,
	icon = 60043,
	last_effect = "hongsebuff"
}
