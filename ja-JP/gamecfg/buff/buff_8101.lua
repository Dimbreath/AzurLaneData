slot2.trigger = {
	"onAttach",
	"onUpdate",
	"onFriendlyShipDying",
	"onSubmarinFreeFloat",
	"onAntiSubHateChain"
}
slot2.arg_list = {
	sonarRange = 18,
	sonarFrequency = 3,
	vigilanceRange = 23
}
slot1[1] = {
	type = "BattleBuffAntiSubVigilance"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "潜艇run专用反潜状态--巡逻舰",
	init_effect = "",
	picture = "",
	desc = "潜艇run专用反潜状态",
	stack = 1,
	id = 8101,
	icon = 8101,
	last_effect = ""
}
