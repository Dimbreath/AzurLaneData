slot2.trigger = {
	"onStartGame"
}
slot2.arg_list = {
	skill_id = 10870
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {}
slot2.arg_list = {
	buff_id = 10871,
	shipType = 1,
	target = "TargetPlayerByType"
}
slot1[2] = {
	type = "BattleBuffAura"
}
slot2.trigger = {}
slot2.arg_list = {
	buff_id = 10871,
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
	desc_get = "在队伍中(存活)时，队伍内所有驱逐、轻巡的雷击和装填属性提高5.0%（满级20.0%）",
	name = "华之二水战",
	init_effect = "",
	id = 10870,
	time = 0,
	picture = "",
	desc = "在队伍中(存活)时，队伍内所有驱逐、轻巡的雷击和装填属性提高5.0%（满级20.0%）",
	stack = 1,
	color = "yellow",
	icon = 10870,
	last_effect = ""
}
