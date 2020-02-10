slot2.trigger = {
	"onStartGame"
}
slot2.arg_list = {
	skill_id = 11090,
	target = "TargetSelf"
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {}
slot3.target = {
	"TargetAllHarm",
	"TargetShipType"
}
slot3.ship_type_list = {
	1,
	2
}
slot2.arg_list = {
	buff_id = 11091
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
	desc_get = "在场时，敌方所有驱逐舰、巡洋舰的回避率降低10%（20%）",
	name = "曙光",
	init_effect = "",
	id = 11090,
	time = 0,
	picture = "",
	desc = "在场时，敌方所有驱逐舰、巡洋舰的回避率降低10%（20%）",
	stack = 1,
	color = "yellow",
	icon = 11090,
	last_effect = ""
}
