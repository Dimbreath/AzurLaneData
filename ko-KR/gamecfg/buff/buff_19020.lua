slot2.trigger = {
	"onHPRatioUpdate"
}
slot2.arg_list = {
	hpUpperBound = 0.2,
	skill_id = 19020,
	target = "TargetSelf",
	quota = 1
}
slot1[1] = {
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
	desc_get = "耐久低于20%时，恢复总耐久度15.0%(满级25.0%)的耐久，15秒内炮击提高30%，每场战斗只能发动1次",
	name = "海之女神",
	init_effect = "",
	id = 19020,
	time = 0,
	picture = "",
	desc = "耐久低于20%时，恢复总耐久度$1的耐久，15秒内炮击提高30%，每场战斗只能发动1次",
	stack = 1,
	color = "blue",
	icon = 19020,
	last_effect = "Health"
}
