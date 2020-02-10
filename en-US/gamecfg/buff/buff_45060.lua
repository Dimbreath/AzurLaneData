slot2.trigger = {
	"onFlagShip",
	"onStack"
}
slot3.target = {
	"TargetAllHelp",
	"TargetShipType"
}
slot3.ship_type_list = {
	1,
	2
}
slot2.arg_list = {
	buff_id = 45061
}
slot1[1] = {
	type = "BattleBuffAddBuff"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "指挥喵天赋-水雷魂",
	init_effect = "jinengchufared",
	picture = "",
	desc = "轻巡驱逐鱼雷暴击率提高3%",
	stack = 2,
	id = 45060,
	icon = 45060,
	last_effect = ""
}
