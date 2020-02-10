slot2.trigger = {
	"onUpdate"
}
slot2.arg_list = {
	minRestHPRatio = 0.01,
	time = 1,
	maxHPRatio = 0.06
}
slot1[1] = {
	type = "BattleBuffDOT"
}
slot2.trigger = {
	"onRemove"
}
slot2.arg_list = {
	maxHPRatio = 0.3
}
slot1[2] = {
	type = "BattleBuffHOT"
}
slot0.effect_list = {}

return {
	time = 5,
	name = "测试-不死鸟-DOT和HOT",
	init_effect = "",
	picture = "",
	desc = "600081DOT,600082HOT",
	stack = 1,
	id = 60008,
	icon = 60008,
	last_effect = "hongsebuff"
}
