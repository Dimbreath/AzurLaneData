slot2.trigger = {
	""
}
slot3.target = {
	"TargetPlayerLeaderShip"
}
slot2.arg_list = {
	buff_id = 99911141
}
slot1[1] = {
	type = "BattleBuffAura"
}
slot2.trigger = {
	"onAttach",
	"onRemove"
}
slot2.arg_list = {}
slot1[2] = {
	type = "BattleFleetBuffInk"
}
slot2.trigger = {}
slot3.target = {
	"TargetAllHarm"
}
slot2.arg_list = {}
slot1[3] = {
	type = "BattleFleetBuffBlindAura"
}
slot0.effect_list = {}

return {
	time = 10,
	name = "视野限制-敌方隐藏光环-属性修改",
	init_effect = "",
	picture = "",
	desc = "",
	stack = 1,
	id = 99911141,
	icon = 9,
	last_effect = ""
}
