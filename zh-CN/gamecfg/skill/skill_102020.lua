return {
	uiEffect = "",
	name = "22领队技能",
	cd = 0,
	picture = "0",
	desc = "22领队技能",
	painting = 1,
	id = 102020,
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
			target_choise = "TargetAllHelp",
			arg_list = {
				buff_id = 102021,
				effectFilter = {
					{
						"TargetID",
						"=",
						10200011
					},
					{
						"TargetID",
						"=",
						10200012
					},
					{
						"TargetID",
						"=",
						10200013
					},
					{
						"TargetID",
						"=",
						10200014
					},
					{
						"TargetID",
						"=",
						10200021
					},
					{
						"TargetID",
						"=",
						10200022
					},
					{
						"TargetID",
						"=",
						10200023
					},
					{
						"TargetID",
						"=",
						10200024
					}
				}
			}
		}
	}
}
