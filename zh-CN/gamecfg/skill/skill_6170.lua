return {
	uiEffect = "",
	name = "喵喵治愈",
	cd = 0,
	picture = "0",
	aniEffect = "",
	desc = "喵喵治愈",
	painting = 0,
	id = 6170,
	effect_list = {
		{
			targetAniEffect = "",
			casterAniEffect = "",
			type = "BattleSkillAddBuff",
			target_choise = "TargetSelf",
			arg_list = {
				buff_id = 6171,
				effectFilter = {
					{
						"TargetID",
						"=",
						312011
					},
					{
						"TargetID",
						"=",
						312012
					},
					{
						"TargetID",
						"=",
						312013
					},
					{
						"TargetID",
						"=",
						312014
					}
				}
			}
		}
	}
}
