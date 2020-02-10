slot2.trigger = {
	"onAttach"
}
slot2.arg_list = {
	add = 14,
	mul = 0
}
slot1[1] = {
	type = "BattleBuffFixVelocity"
}
slot2.trigger = {
	"onBulletCreate"
}
slot3.index = {
	-1
}
slot2.arg_list = {
	number = 0.8,
	attr = "damageRatioBullet"
}
slot1[2] = {
	type = "BattleBuffAddBulletAttr"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "日常关卡技能无效,全弹强化",
	init_effect = "",
	id = 3500,
	picture = "",
	desc = "",
	stack = 1,
	color = "yellow",
	icon = 3500,
	last_effect = ""
}
