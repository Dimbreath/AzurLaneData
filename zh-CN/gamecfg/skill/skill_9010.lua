return {
	uiEffect = "",
	name = "东煌之绊",
	cd = 0,
	picture = "0",
	desc = "东煌之绊",
	painting = 1,
	id = 9010,
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
				buff_id = 9011,
				effectFilter = {
					{
						"TargetID",
						"=",
						502011
					},
					{
						"TargetID",
						"=",
						502012
					},
					{
						"TargetID",
						"=",
						502013
					},
					{
						"TargetID",
						"=",
						502014
					},
					{
						"TargetID",
						"=",
						502021
					},
					{
						"TargetID",
						"=",
						502022
					},
					{
						"TargetID",
						"=",
						502023
					},
					{
						"TargetID",
						"=",
						502024
					},
					{
						"TargetID",
						"=",
						502031
					},
					{
						"TargetID",
						"=",
						502032
					},
					{
						"TargetID",
						"=",
						502033
					},
					{
						"TargetID",
						"=",
						502034
					}
				}
			}
		}
	}
}
