return {
	uiEffect = "",
	name = "little LuckyE",
	cd = 0,
	picture = "0",
	desc = "减速",
	painting = 1,
	id = 14502,
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
			target_choise = "TargetAllHarm",
			arg_list = {
				buff_id = 14504
			}
		}
	}
}
