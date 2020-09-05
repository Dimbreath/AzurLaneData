return {
	uiEffect = "",
	name = "Z字旗",
	cd = 0,
	picture = "0",
	desc = "Z字旗",
	painting = 0,
	id = 6230,
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
				buff_id = 6234
			}
		},
		{
			targetAniEffect = "",
			casterAniEffect = "",
			type = "BattleSkillAddBuff",
			target_choise = "TargetSelf",
			arg_list = {
				buff_id = 6231,
				effectFilter = {
					{
						"TargetID",
						"=",
						305111
					},
					{
						"TargetID",
						"=",
						305112
					},
					{
						"TargetID",
						"=",
						305113
					},
					{
						"TargetID",
						"=",
						305114
					}
				}
			}
		}
	}
}
