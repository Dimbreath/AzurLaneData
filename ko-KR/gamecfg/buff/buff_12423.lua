slot0.blink = {
	1,
	0,
	0,
	0.3,
	0.3
}
slot2.trigger = {
	"onBulletCreate"
}
slot3.index = {
	1
}
slot2.arg_list = {
	number = 1,
	attr = "damageRatioBullet"
}
slot1[1] = {
	type = "BattleBuffAddBulletAttr"
}
slot0.effect_list = {}

return {
	name = "重点打击",
	init_effect = "jinengchufared",
	id = 12423,
	time = 3,
	picture = "",
	desc = "3秒内1号位置装备发射的子弹伤害提高",
	stack = 1,
	color = "red",
	icon = 12420,
	last_effect = ""
}
