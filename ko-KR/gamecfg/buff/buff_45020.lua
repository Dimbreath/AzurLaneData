slot2.trigger = {
	"onFlagShip",
	"onStack"
}
slot2.arg_list = {
	buff_id = 45021,
	target = "TargetAllHelp"
}
slot1[1] = {
	type = "BattleBuffAddBuff"
}
slot2.trigger = {
	"onSubLeader",
	"onStack"
}
slot3.target = {
	"TargetAllHelp",
	"TargetShipType"
}
slot3.ship_type_list = {
	8
}
slot2.arg_list = {
	buff_id = 45021
}
slot1[2] = {
	type = "BattleBuffAddBuff"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "指挥喵天赋-侵略如火",
	init_effect = "jinengchufared",
	picture = "",
	desc = "舰队成员造成伤害提高3%",
	stack = 2,
	id = 45020,
	icon = 45020,
	last_effect = ""
}
