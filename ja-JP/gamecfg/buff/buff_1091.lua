slot2.trigger = {
	"onStartGame"
}
slot2.arg_list = {
	skill_id = 1091
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {}
slot2.arg_list = {
	buff_id = 1090,
	shipType = 1,
	target = "TargetPlayerByType"
}
slot1[2] = {
	type = "BattleBuffAura"
}
slot2.trigger = {}
slot2.arg_list = {
	buff_id = 1090,
	shipType = 2,
	target = "TargetPlayerByType"
}
slot1[3] = {
	type = "BattleBuffAura"
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
	desc_get = "在队伍中(存活)时，队伍内所有驱逐、轻巡的雷击和装填属性提高3.0%（满级15.0%）",
	name = "水雷战队",
	init_effect = "",
	id = 1091,
	time = 0,
	picture = "",
	desc = "在队伍中(存活)时，队伍内所有驱逐、轻巡的雷击和装填属性提高3.0%（满级15.0%）",
	stack = 1,
	color = "yellow",
	icon = 1090,
	last_effect = ""
}
