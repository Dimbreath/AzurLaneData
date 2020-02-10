slot2.trigger = {
	"onFlagShip"
}
slot3.target = {
	"TargetAllHelp",
	"TargetShipType"
}
slot3.ship_type_list = {
	1
}
slot2.arg_list = {
	buff_id = 98011
}
slot1[1] = {
	type = "BattleBuffAddBuff"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "指挥喵buff第一入口",
	init_effect = "",
	id = 98010,
	picture = "",
	desc = "该入口提供战外挂载到战内",
	stack = 1,
	color = "yellow",
	icon = 98010,
	last_effect = ""
}
