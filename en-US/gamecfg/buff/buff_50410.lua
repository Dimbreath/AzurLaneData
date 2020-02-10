slot2.trigger = {
	"onUpdate"
}
slot2.arg_list = {
	skill_id = 50410,
	time = 20
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {
	"onUpdate"
}
slot2.arg_list = {
	quota = 1,
	skill_id = 50410,
	time = 2
}
slot1[2] = {
	type = "BattleBuffCastSkill"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "敌方指挥舰——护盾",
	init_effect = "",
	id = 50410,
	picture = "",
	desc = "队友护盾",
	stack = 1,
	color = "yellow",
	icon = 50410,
	last_effect = ""
}
