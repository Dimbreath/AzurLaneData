slot2.trigger = {
	"onStartGame"
}
slot2.arg_list = {
	skill_id = 10400
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot2.trigger = {}
slot2.arg_list = {
	buff_id = 10401,
	target = "TargetPlayerFlagShip"
}
slot1[2] = {
	type = "BattleBuffAura"
}
slot0.effect_list = {}
slot1.addition = {
	"15.0%(+1.1%)"
}
slot0[1] = {
	desc = "在队伍中时降低旗舰受到的伤害15.0%"
}
slot1.addition = {
	"16.1%(+1.1%)"
}
slot0[2] = {
	desc = "在队伍中时降低旗舰受到的伤害16.1%"
}
slot1.addition = {
	"17.2%(+1.1%)"
}
slot0[3] = {
	desc = "在队伍中时降低旗舰受到的伤害17.2%"
}
slot1.addition = {
	"18.3%(+1.1%)"
}
slot0[4] = {
	desc = "在队伍中时降低旗舰受到的伤害18.3%"
}
slot1.addition = {
	"19.4%(+1.1%)"
}
slot0[5] = {
	desc = "在队伍中时降低旗舰受到的伤害19.4%"
}
slot1.addition = {
	"20.5%(+1.1%)"
}
slot0[6] = {
	desc = "在队伍中时降低旗舰受到的伤害20.5%"
}
slot1.addition = {
	"21.6%(+1.1%)"
}
slot0[7] = {
	desc = "在队伍中时降低旗舰受到的伤害21.6%"
}
slot1.addition = {
	"22.7%(+1.1%)"
}
slot0[8] = {
	desc = "在队伍中时降低旗舰受到的伤害22.7%"
}
slot1.addition = {
	"23.8%(+1.2%)"
}
slot0[9] = {
	desc = "在队伍中时降低旗舰受到的伤害23.8%"
}
slot1.addition = {
	"25.0%"
}
slot0[10] = {
	desc = "在队伍中时降低旗舰受到的伤害25.0%"
}

return {
	desc_get = "在队伍中时降低旗舰受到的伤害15.0%(满级25.0%)",
	name = "旗舰掩护",
	init_effect = "",
	id = 10400,
	time = 0,
	picture = "",
	desc = "在队伍中时降低旗舰受到的伤害$1",
	stack = 1,
	color = "yellow",
	icon = 10400,
	last_effect = ""
}
