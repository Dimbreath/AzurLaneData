slot0.blink = {
	1,
	0,
	0,
	0.3,
	0.3
}
slot2.trigger = {
	"onWeaponSteday"
}
slot3.index = {
	1
}
slot2.arg_list = {
	buff_id = 101052,
	target = "TargetSelf"
}
slot1[1] = {
	type = "BattleBuffAddBuff"
}
slot2.trigger = {
	"onFire"
}
slot3.index = {
	1
}
slot2.arg_list = {
	count = 1
}
slot1[2] = {
	type = "BattleBuffCancelBuff"
}
slot0.effect_list = {}

return {
	name = "十字缔结",
	init_effect = "jinengchufared",
	time = 0,
	picture = "",
	desc = "使得主炮的子弹暴击率提高100%",
	stack = 1,
	id = 101051,
	icon = 101051,
	last_effect = ""
}
