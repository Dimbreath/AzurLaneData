return {
	uiEffect = "",
	name = "铁底湾之夜",
	cd = 0,
	picture = "0",
	desc = "铁底湾之夜",
	painting = 1,
	id = 11010,
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
			target_choise = "TargetSelf",
			arg_list = {
				buff_id = 11012
			}
		},
		{
			targetAniEffect = "",
			casterAniEffect = "",
			type = "BattleSkillAddBuff",
			target_choise = "TargetAllHelp",
			arg_list = {
				buff_id = 11013,
				effectFilter = {
					{
						"TargetID",
						"=",
						105141
					},
					{
						"TargetID",
						"=",
						105142
					},
					{
						"TargetID",
						"=",
						105143
					},
					{
						"TargetID",
						"=",
						105144
					}
				}
			}
		},
		{
			targetAniEffect = "",
			casterAniEffect = "",
			type = "BattleSkillAddBuff",
			target_choise = "TargetAllHelp",
			arg_list = {
				buff_id = 11014,
				effectFilter = {
					{
						"TargetID",
						"=",
						105141
					},
					{
						"TargetID",
						"=",
						105142
					},
					{
						"TargetID",
						"=",
						105143
					},
					{
						"TargetID",
						"=",
						105144
					}
				}
			}
		}
	}
}
