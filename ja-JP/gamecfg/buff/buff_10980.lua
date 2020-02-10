slot2.trigger = {
	"onStartGame"
}
slot2.arg_list = {
	skill_id = 10980
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {}
slot2.arg_list = {
	buff_id = 10981,
	target = "TargetPlayerMainFleet"
}
slot1[2] = {
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
	desc_get = "在队伍中(存活)时，主力舰队受到航空伤害降低5%(满级15%)",
	name = "对空掩护",
	init_effect = "",
	id = 10980,
	time = 0,
	picture = "",
	desc = "在队伍中(存活)时，主力舰队受到航空伤害降低5%(满级15%)",
	stack = 1,
	color = "yellow",
	icon = 10980,
	last_effect = ""
}
