slot0.blink = {
	1,
	0,
	0,
	0.3,
	0.3
}
slot2.trigger = {
	"onAttach",
	"onRemove"
}
slot2.arg_list = {
	number = 3000,
	attr = "cannonPower"
}
slot1[1] = {
	type = "BattleBuffAddAttrRatio"
}
slot0.effect_list = {}

return {
	name = "真红の不死鸟",
	init_effect = "jinengchufared",
	id = 10061,
	time = 15,
	picture = "",
	desc = "提高炮击属性",
	stack = 1,
	color = "red",
	icon = 10061,
	last_effect = ""
}
