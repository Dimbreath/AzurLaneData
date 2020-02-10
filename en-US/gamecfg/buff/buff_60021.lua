slot2.trigger = {
	"onAttach",
	"onStack",
	"onRemove"
}
slot2.arg_list = {
	group = 60021,
	add = 0,
	mul = 500
}
slot1[1] = {
	type = "BattleBuffFixVelocity"
}
slot0.effect_list = {}

return {
	time = 1,
	name = "测试-反击-光环特效",
	init_effect = "",
	picture = "",
	desc = "5%移动加速",
	stack = 20,
	id = 60021,
	icon = 60021,
	last_effect = ""
}
