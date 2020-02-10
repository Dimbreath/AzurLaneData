slot2.trigger = {
	"onAttach"
}
slot2.arg_list = {
	ability = "support",
	convertRate = -0.00025,
	convertAttr = "injureRatioByCannon"
}
slot1[1] = {
	type = "BattleBuffAddAttrCommander"
}
slot2.trigger = {
	"onAttach"
}
slot2.arg_list = {
	ability = "support",
	convertRate = 0.8,
	convertAttr = "loadSpeed"
}
slot1[2] = {
	type = "BattleBuffAddAttrRatioCommander"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "",
	init_effect = "",
	id = 40311,
	picture = "",
	desc = "战列受到炮击减伤,+装填",
	stack = 1,
	color = "yellow",
	icon = 40310,
	last_effect = ""
}
