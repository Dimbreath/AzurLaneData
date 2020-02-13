return {
	uiEffect = "",
	name = "铁底湾之夜",
	cd = 0,
	picture = "0",
	desc = "",
	painting = 0,
	id = 11012,
	castCV = "",
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
			target_choise = "TargetAllHelp",
			arg_list = {
				buff_id = 11011,
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
