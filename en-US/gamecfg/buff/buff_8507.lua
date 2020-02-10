slot0.blink = {
	0,
	0.7,
	1,
	0.3,
	0.3
}
slot2.trigger = {
	"onAttach",
	"onStack",
	"onRemove"
}
slot2.arg_list = {
	number = 50,
	attr = "loadspeed"
}
slot1[1] = {
	type = "BattleBuffAddAttrRatio"
}
slot0.effect_list = {}

return {
	name = "武器攻击速度加快0.5倍",
	init_effect = "",
	time = 0,
	picture = "",
	desc = "武器攻击速度加快0.5倍",
	stack = 1,
	id = 8057,
	icon = 8057,
	last_effect = "lansebuff"
}
