slot2.trigger = {
	"onFlagShip",
	"onStack"
}
slot3.target = {
	"TargetAllHelp",
	"TargetShipType"
}
slot3.ship_type_list = {
	4,
	5
}
slot2.arg_list = {
	buff_id = 45011
}
slot1[1] = {
	type = "BattleBuffAddBuff"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "指挥喵天赋-一发入魂",
	init_effect = "jinengchufared",
	picture = "",
	desc = "战列战巡的子弹暴击率提高3%",
	stack = 2,
	id = 45010,
	icon = 45010,
	last_effect = ""
}
