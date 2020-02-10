slot2.arg_list = {
	exceptCaster = true,
	maxHPRatio = 0.09
}
slot1[1] = {
	targetAniEffect = "",
	casterAniEffect = "",
	type = "BattleSkillHeal",
	target_choise = "TargetAllHelp"
}
slot2.arg_list = {
	buff_id = 50015,
	exceptCaster = true
}
slot1[2] = {
	targetAniEffect = "",
	casterAniEffect = "",
	type = "BattleSkillAddBuff",
	target_choise = "TargetAllHelp"
}
slot2.arg_list = {
	buff_id = 50012
}
slot1[3] = {
	target_choise = "TargetSelf",
	type = "BattleSkillAddBuff"
}
slot0.effect_list = {}

return {
	uiEffect = "",
	name = "敌方维修船维修技能",
	cd = 0,
	picture = "0",
	aniEffect = "",
	desc = "6秒后回复9%HP，跳转至下一强度",
	painting = 0,
	id = 50011
}
