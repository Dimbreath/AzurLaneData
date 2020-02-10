slot4[1] = {
	"TargetID",
	"~=",
	10706
}
slot3.effectFilter = {}
slot2.arg_list = {
	buff_id = 60011,
	targetMaxHPRatio = 0.75
}
slot1[1] = {
	targetAniEffect = "",
	casterAniEffect = "",
	type = "BattleSkillAddBuff",
	target_choise = "TargetHelpLeastHPRatio"
}
slot4[1] = {
	"TargetID",
	"=",
	10706
}
slot3.effectFilter = {}
slot2.arg_list = {
	maxHPRatio = 0.35
}
slot1[2] = {
	targetAniEffect = "",
	casterAniEffect = "",
	type = "BattleSkillHeal",
	target_choise = "TargetSameToLastEffect"
}
slot0.effect_list = {}

return {
	uiEffect = "",
	name = "女灶神-神之恩赐",
	cd = 0,
	picture = "0",
	aniEffect = "",
	desc = "回血",
	painting = 1,
	id = 60005
}
