slot2.trigger = {
	"onStartGame"
}
slot3.group = {
	id = 6140,
	level = 2
}
slot2.arg_list = {
	skill_id = 6150
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "灭火器T2",
	init_effect = "",
	id = 6150,
	picture = "",
	desc = "起火概率降低20%，持续时间缩短3秒，起火伤害降低15%，同类效果取最大值，不可叠加",
	stack = 1,
	color = "blue",
	icon = 6150,
	last_effect = ""
}
