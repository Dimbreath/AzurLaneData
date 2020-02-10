slot2.trigger = {
	"onFire"
}
slot3.index = {
	1
}
slot2.arg_list = {
	countTarget = 6,
	countType = 29470
}
slot1[1] = {
	type = "BattleBuffCount"
}
slot2.trigger = {
	"onBattleBuffCount"
}
slot2.arg_list = {
	skill_id = 29472,
	target = "TargetSelf",
	countType = 29470
}
slot1[2] = {
	type = "BattleBuffCastSkill"
}
slot0.effect_list = {}
slot0[1] = {}

return {
	time = 0,
	name = "专属弹幕",
	init_effect = "",
	id = 29472,
	picture = "",
	desc = "主武器每进行6次攻击，触发专属弹幕-希佩尔海军上将μII",
	stack = 1,
	color = "red",
	icon = 29470,
	last_effect = ""
}
