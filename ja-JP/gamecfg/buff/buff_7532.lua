slot0.blink = {
	1,
	0,
	0,
	0.3,
	0.3
}
slot2.trigger = {
	"onAttach",
	"onTorpedoWeaponBulletCreate"
}
slot2.arg_list = {
	number = 0.02,
	attr = "damageRatioBullet"
}
slot1[1] = {
	type = "BattleBuffAddBulletAttr"
}
slot0.effect_list = {}

return {
	name = "传颂之物前排雷伤2%",
	init_effect = "jinengchufared",
	id = 7532,
	time = 0,
	picture = "",
	desc = "传颂之物前排雷伤2%",
	stack = 1,
	color = "red",
	icon = 7530,
	last_effect = ""
}
