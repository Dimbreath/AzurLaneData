slot1[1] = SYSTEM_SCENARIO
slot1[2] = SYSTEM_ROUTINE
slot1[3] = SYSTEM_DUEL
slot1[4] = SYSTEM_SHAM
slot0.limit = {}
slot2.trigger = {
	"onAttach",
	"onRemove"
}
slot2.arg_list = {
	number = 1,
	attr = "isInvincible"
}
slot1[1] = {
	type = "BattleBuffAddAttr"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "挑战后排永久无敌",
	init_effect = "",
	picture = "",
	desc = "挑战后排永久无敌",
	stack = 1,
	id = 50,
	icon = 50,
	last_effect = ""
}
