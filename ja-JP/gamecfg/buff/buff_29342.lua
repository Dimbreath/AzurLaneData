slot2.trigger = {
	"onSubmarineRaid",
	"onSubmarineFreeSpecial"
}
slot2.arg_list = {
	quota = 1,
	skill_id = 29342,
	target = "TargetSelf"
}
slot1[1] = {
	type = "BattleBuffCastSkill"
}
slot0.effect_list = {}
slot0[1] = {}

return {
	time = 0,
	name = "专属弹幕",
	init_effect = "",
	id = 29342,
	picture = "",
	desc = "进入战斗后，触发专属弹幕-大青花鱼II",
	stack = 1,
	color = "red",
	icon = 29340,
	last_effect = ""
}
