slot2.trigger = {
	"onAttach"
}
slot2.arg_list = {
	ability = "command",
	convertRate = 0.8,
	convertAttr = "cannonPower"
}
slot1[1] = {
	type = "BattleBuffAddAttrRatioCommander"
}
slot2.trigger = {
	"onAttach"
}
slot2.arg_list = {
	ability = "command",
	convertRate = 0.8,
	convertAttr = "attackRating"
}
slot1[2] = {
	type = "BattleBuffAddAttrRatioCommander"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "战列-指挥-炮击II+战列-指挥-命中II",
	init_effect = "",
	id = 40241,
	picture = "",
	desc = "该入口提供战外挂载到战内",
	stack = 1,
	color = "yellow",
	icon = 40240,
	last_effect = ""
}
