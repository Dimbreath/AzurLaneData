slot2.trigger = {
	"onFlagShip",
	"onStack"
}
slot2.arg_list = {
	buff_id = 45031,
	target = "TargetAllHelp"
}
slot1[1] = {
	type = "BattleBuffAddBuff"
}
slot2.trigger = {
	"onSubLeader ",
	"onStack"
}
slot3.target = {
	"TargetAllHelp",
	"TargetShipType"
}
slot3.ship_type_list = {
	8,
	17
}
slot2.arg_list = {
	buff_id = 45031
}
slot1[2] = {
	type = "BattleBuffAddBuff"
}
slot0.effect_list = {}

return {
	time = 0,
	name = "指挥喵天赋-不动如山",
	init_effect = "jinengchufared",
	picture = "",
	desc = "舰队成员受到伤害降低3%",
	stack = 2,
	id = 45030,
	icon = 45030,
	last_effect = ""
}
