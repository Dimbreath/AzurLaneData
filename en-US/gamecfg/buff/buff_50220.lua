slot2.trigger = {}
slot2.arg_list = {
	buff_id = 50221,
	exceptCaster = true,
	target = "TargetAllHelp"
}
slot1[1] = {
	type = "BattleBuffAura"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "敌方指挥舰指挥技能——伤害上升",
	init_effect = "",
	id = 50220,
	picture = "",
	desc = "指挥技能——伤害上升",
	stack = 1,
	color = "red",
	icon = 50220,
	last_effect = "zhihuiRing02"
}
