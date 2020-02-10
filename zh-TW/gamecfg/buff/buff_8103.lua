slot2.trigger = {
	"onAttach",
	"onUpdate",
	"onFriendlyShipDying",
	"onSubmarinFreeFloat",
	"onAntiSubHateChain"
}
slot2.arg_list = {
	sonarRange = 15,
	sonarFrequency = 5,
	vigilanceRange = 26
}
slot1[1] = {
	type = "BattleBuffAntiSubVigilance"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "潜艇run专用反潜状态--护卫舰",
	init_effect = "",
	picture = "",
	desc = "潜艇run专用反潜状态",
	stack = 1,
	id = 8103,
	icon = 8103,
	last_effect = ""
}
