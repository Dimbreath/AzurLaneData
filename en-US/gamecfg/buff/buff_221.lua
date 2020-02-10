slot2.trigger = {
	"onAttach"
}
slot2.arg_list = {
	number = 0.2,
	attr = "damageRatioByAir"
}
slot1[1] = {
	type = "BattleBuffAddAttr"
}
slot2.trigger = {
	"onAttach"
}
slot2.arg_list = {
	number = -0.1,
	attr = "injureRatioByAir"
}
slot1[2] = {
	type = "BattleBuffAddAttr"
}
slot2.trigger = {
	"onAttach"
}
slot2.arg_list = {
	number = 1000,
	attr = "attackRating"
}
slot1[3] = {
	type = "BattleBuffAddAttrRatio"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "制空权确保",
	init_effect = "",
	id = 221,
	picture = "",
	desc = "",
	stack = 1,
	color = "yellow",
	icon = 221,
	last_effect = ""
}
