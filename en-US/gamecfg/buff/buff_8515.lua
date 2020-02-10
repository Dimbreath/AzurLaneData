slot2.trigger = {
	"onUpdate"
}
slot2.arg_list = {
	time = 3,
	maxHPRatio = 0.02
}
slot1[1] = {
	type = "BattleBuffHOT"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "重巡BOSS血量低于30%时获得buff每三秒恢复2%血量直到生命值高于30%结束",
	init_effect = "",
	picture = "",
	desc = "重巡BOSS血量低于30%时获得buff每三秒恢复2%血量直到生命值高于30%结束",
	stack = 1,
	id = 8515,
	icon = 8515,
	last_effect = "Health"
}
