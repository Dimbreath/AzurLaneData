return {
	time = 5,
	name = "毛系V2 余辉支援弹幕LV5",
	init_effect = "",
	id = 8855,
	picture = "",
	desc = "",
	stack = 1,
	color = "yellow",
	icon = 8855,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onFlagShip"
			},
			arg_list = {
				buff_id = 8856,
				target = "TargetSelf"
			}
		}
	}
}
