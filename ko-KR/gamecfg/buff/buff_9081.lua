slot2.trigger = {
	"onStartGame"
}
slot2.arg_list = {
	skill_id = 9081
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {}
slot2.arg_list = {
	buff_id = 9080,
	target = "TargetPlayerFlagShip"
}
slot1[2] = {
	type = "BattleBuffAura"
}
slot0.effect_list = {}

return {
	desc_get = "在队伍中时降低旗舰受到的伤害15.0%(满级25.0%)",
	name = "旗舰掩护-LV8",
	init_effect = "",
	id = 9081,
	time = 0,
	picture = "",
	desc = "在队伍中时降低旗舰受到的伤害$1",
	stack = 1,
	color = "yellow",
	icon = 9080,
	last_effect = ""
}
