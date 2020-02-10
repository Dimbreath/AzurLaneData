slot2.trigger = {
	"onStartGame"
}
slot3.group = {
	id = 6010,
	level = 2
}
slot2.arg_list = {
	skill_id = 6020
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "防鱼雷隔舱T2",
	init_effect = "",
	id = 6020,
	picture = "",
	desc = "受到鱼雷伤害减少20%，同类效果取最大值，不可叠加",
	stack = 1,
	color = "yellow",
	icon = 6020,
	last_effect = ""
}
