slot2.trigger = {
	"onStartGame"
}
slot2.arg_list = {
	skill_id = 4141
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {}
slot2.arg_list = {
	buff_id = 4140,
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
	desc_get = "在队伍中时降低主力舰队受到的伤害1.5%(满级6.0%)，受到来自轻巡驱逐的伤害额外降低1%（满级10%）",
	name = "机动护卫",
	init_effect = "jinengchufablue",
	id = 4141,
	time = 0,
	picture = "",
	desc = "在队伍中时降低主力舰队受到的伤害$1，受到来自轻巡驱逐的伤害额外降低$2",
	stack = 1,
	color = "blue",
	icon = 4140,
	last_effect = ""
}
