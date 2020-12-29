return {
	uiEffect = "",
	name = "狼群战术-U37",
	cd = 0,
	picture = "0",
	desc = "狼群战术-U37",
	painting = 1,
	id = 13940,
	castCV = "skill",
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
			target_choise = {
				"TargetAllHelp",
				"TargetNationality",
				"TargetShipType"
			},
			arg_list = {
				buff_id = 13942,
				nationality = 4,
				ship_type_list = {
					8
				}
			}
		}
	}
}
