return {
	uiEffect = "",
	name = "战术指挥·战列舰",
	cd = 0,
	picture = "0",
	desc = "提高舰队中所有战列舰的炮击、雷击、装填属性",
	painting = 1,
	id = 1053,
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
			target_choise = "TargetPlayerByType",
			arg_list = {
				buff_id = 1050,
				shipType = 4
			}
		},
		{
			targetAniEffect = "",
			casterAniEffect = "",
			type = "BattleSkillAddBuff",
			target_choise = "TargetPlayerByType",
			arg_list = {
				buff_id = 1050,
				shipType = 5
			}
		},
		{
			targetAniEffect = "",
			casterAniEffect = "",
			type = "BattleSkillAddBuff",
			target_choise = "TargetPlayerByType",
			arg_list = {
				buff_id = 1050,
				shipType = 10
			}
		}
	}
}
