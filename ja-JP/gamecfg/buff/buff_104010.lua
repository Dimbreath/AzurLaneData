slot2.trigger = {
	"onUpdate"
}
slot2.arg_list = {
	buff_id = 104011,
	target = "TargetSelf",
	time = 20
}
slot1[1] = {
	type = "BattleBuffAddBuff"
}
slot2.trigger = {
	"onUpdate"
}
slot2.arg_list = {
	skill_id = 104010,
	time = 20
}
slot1[2] = {
	type = "BattleBuffCastSkill"
}
slot0.effect_list = {}
slot0[1] = {}
slot0[2] = {}
slot0[3] = {}
slot0[4] = {}
slot0[5] = {}
slot0[6] = {}
slot0[7] = {}
slot0[8] = {}
slot0[9] = {}
slot0[10] = {}

return {
	time = 0,
	name = "爱碳光波",
	init_effect = "",
	id = 104010,
	picture = "",
	desc = "战斗中，每20秒启用一个效果",
	stack = 1,
	color = "yellow",
	icon = 104010,
	last_effect = ""
}
