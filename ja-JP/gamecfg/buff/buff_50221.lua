slot2.trigger = {
	"onAttach",
	"onRemove"
}
slot2.arg_list = {
	number = 0.3,
	attr = "damageRatioBullet"
}
slot1[1] = {
	type = "BattleBuffAddAttr"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "敌方指挥舰指挥技能——伤害上升",
	init_effect = "",
	picture = "",
	desc = "指挥技能——伤害上升",
	stack = 1,
	id = 50221,
	icon = 50220,
	last_effect = "zhihuiRing02_buff"
}
