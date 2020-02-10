slot0.blink = {
	1,
	0,
	0,
	0.3,
	0.3
}
slot2.trigger = {
	"onChargeWeaponFire"
}
slot2.arg_list = {
	buff_id = 10271,
	target = "TargetSelf"
}
slot1[1] = {
	type = "BattleBuffAddBuff"
}
slot0.effect_list = {}

return {
	name = "最后的荣耀",
	init_effect = "jinengchufared",
	time = 0,
	picture = "",
	desc = "武器开火的时候获得子弹增伤效果",
	stack = 1,
	id = 10272,
	icon = 10272,
	last_effect = ""
}
