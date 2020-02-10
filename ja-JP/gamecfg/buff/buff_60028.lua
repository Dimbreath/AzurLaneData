slot3.trigger = {
	"onAttach",
	"onRemove"
}
slot3.arg_list = {
	variable = "SpeedRatioByIFF",
	key = -1,
	resetNumber = 1,
	number = 0.4
}
slot2[1] = {
	type = "BattleBuffWorldVariable"
}
slot3.trigger = {
	"onAttach",
	"onRemove"
}
slot3.arg_list = {
	variable = "MapSpeedRatio",
	resetNumber = 1,
	number = 0.4
}
slot2[2] = {
	type = "BattleBuffWorldVariable"
}
slot1.effect_list = {}
slot0[1] = {}

return {
	uiEffect = "SlowEffectUI",
	name = "测试-伊丽莎白-减速",
	init_effect = "jiasuBUFF",
	time = 6,
	picture = "",
	desc = "测试-伊丽莎白-减速",
	stack = 1,
	id = 60028,
	icon = 60028,
	last_effect = "SPD"
}
