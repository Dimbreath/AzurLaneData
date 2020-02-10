slot2.trigger = {
	"onAttach"
}
slot2.arg_list = {
	number = -0.5,
	attr = "damageRatioBullet"
}
slot1[1] = {
	type = "BattleBuffAddAttr"
}
slot2.trigger = {
	"onAttach",
	"onRemove"
}
slot2.arg_list = {
	tag = "danyaokuifa"
}
slot1[2] = {
	type = "BattleBuffAddTag"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "弹药匮乏",
	init_effect = "",
	id = 211,
	picture = "",
	desc = "舰队伤害降低50%",
	stack = 1,
	color = "yellow",
	icon = 211,
	last_effect = ""
}
