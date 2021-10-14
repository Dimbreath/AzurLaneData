return {
	uiEffect = "",
	name = "",
	cd = 0,
	picture = "0",
	desc = "",
	painting = 1,
	id = 9677,
	aniEffect = {
		effect = "jineng",
		offset = {
			0,
			-2,
			0
		}
	},
	effect_list = {
		{
			targetAniEffect = "",
			casterAniEffect = "",
			type = "BattleSkillAddBuff",
			target_choise = "TargetPlayerVanguardFleet",
			arg_list = {
				buff_id = 9679
			}
		},
		{
			targetAniEffect = "",
			casterAniEffect = "",
			type = "BattleSkillEditTag",
			target_choise = "TargetShipTag",
			arg_list = {
				tag = "14_NewWave",
				operation = -1,
				ship_tag_list = {
					"14_NewWave"
				}
			}
		}
	}
}
