return {
	uiEffect = "",
	name = "little LuckyE",
	cd = 0,
	picture = "0",
	desc = "空中支援时造成2倍伤害",
	painting = 1,
	id = 14504,
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
				buff_id = 14502
			}
		}
	}
}
