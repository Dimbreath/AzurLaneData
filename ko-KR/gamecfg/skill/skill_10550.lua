return {
	uiEffect = "",
	name = "后勤维修",
	cd = 0,
	picture = "0",
	desc = "回血",
	painting = 1,
	id = 10550,
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
				buff_id = 10551
			}
		}
	}
}
