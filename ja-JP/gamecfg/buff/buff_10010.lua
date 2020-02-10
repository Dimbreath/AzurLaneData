slot2.trigger = {
	"onHPRatioUpdate"
}
slot2.arg_list = {
	hpUpperBound = 0.2,
	skill_id = 10010,
	target = "TargetSelf",
	quota = 1
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot0.effect_list = {}
slot1.addition = {
	"15.0%(+1.1%)"
}
slot0[1] = {
	desc = "耐久低于20%时，恢复16.0%耐久，每场战斗只能触发1次"
}
slot1.addition = {
	"16.1%(+1.1%)"
}
slot0[2] = {
	desc = "耐久低于20%时，恢复16.1%耐久，每场战斗只能触发1次"
}
slot1.addition = {
	"17.2%(+1.1%)"
}
slot0[3] = {
	desc = "耐久低于20%时，恢复17.2%耐久，每场战斗只能触发1次"
}
slot1.addition = {
	"18.3%(+1.1%)"
}
slot0[4] = {
	desc = "耐久低于20%时，恢复18.3%耐久，每场战斗只能触发1次"
}
slot1.addition = {
	"19.4%(+1.1%)"
}
slot0[5] = {
	desc = "耐久低于20%时，恢复19.4%耐久，每场战斗只能触发1次"
}
slot1.addition = {
	"20.5%(+1.1%)"
}
slot0[6] = {
	desc = "耐久低于20%时，恢复20.5%耐久，每场战斗只能触发1次"
}
slot1.addition = {
	"21.6%(+1.1%)"
}
slot0[7] = {
	desc = "耐久低于20%时，恢复21.6%耐久，每场战斗只能触发1次"
}
slot1.addition = {
	"22.7%(+1.1%)"
}
slot0[8] = {
	desc = "耐久低于20%时，恢复22.7%耐久，每场战斗只能触发1次"
}
slot1.addition = {
	"23.8%(+1.2%)"
}
slot0[9] = {
	desc = "耐久低于20%时，恢复23.8%耐久，每场战斗只能触发1次"
}
slot1.addition = {
	"25.0%"
}
slot0[10] = {
	desc = "耐久低于20%时，恢复25.0%耐久，每场战斗只能触发1次"
}

return {
	desc_get = "耐久低于20%时，恢复15.0%(满级25.0%)耐久，每场战斗只能触发1次",
	name = "浴火重生",
	init_effect = "",
	id = 10010,
	time = 0,
	picture = "",
	desc = "耐久低于20%时，恢复$1耐久，每场战斗只能触发1次",
	stack = 1,
	color = "blue",
	icon = 10010,
	last_effect = "Health"
}
