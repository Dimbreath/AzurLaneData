return {
	uiEffect = "",
	name = "二航战",
	cd = 0,
	picture = "0",
	desc = "与苍龙同在一个舰队时，航空性能+15%",
	painting = 1,
	id = 10470,
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
				buff_id = 10471
			}
		}
	}
}
