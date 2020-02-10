slot2.trigger = {
	"onAttach"
}
slot2.arg_list = {
	skill_id = 7500
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {
	"onUpdate"
}
slot2.arg_list = {
	skill_id = 7500,
	time = 5
}
slot1[2] = {
	type = "BattleBuffCastSkill"
}
slot0.effect_list = {}

return {
	desc_get = "",
	name = "黑企业剧情战斗技能",
	init_effect = "",
	id = 7501,
	time = 0,
	picture = "",
	desc = "",
	stack = 1,
	color = "red",
	icon = 7500,
	last_effect = ""
}
