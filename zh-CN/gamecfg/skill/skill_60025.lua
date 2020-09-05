return {
	uiEffect = "",
	name = "随机技能-治疗之泉",
	cd = 60,
	picture = "0",
	aniEffect = "",
	desc = "治疗之泉",
	painting = 1,
	id = 60025,
	effect_list = {
		{
			targetAniEffect = "",
			casterAniEffect = "",
			type = "BattleSkillSummon",
			target_choise = "TargetNil",
			arg_list = {
				monsterTemplateID = 60001,
				isUnvisible = true,
				pilotAITemplateID = 10003,
				equipmentList = {},
				buffList = {
					60045
				}
			}
		}
	}
}
