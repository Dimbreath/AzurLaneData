slot2.arg_list = {
	maxHPRatio = 0.2
}
slot1[1] = {
	targetAniEffect = "",
	casterAniEffect = "",
	type = "BattleSkillHeal",
	target_choise = "TargetSelf"
}
slot3.ship_tag_list = {
	"AR-1"
}
slot2.arg_list = {
	tag = "AR-1",
	operation = -1
}
slot1[2] = {
	targetAniEffect = "",
	casterAniEffect = "",
	type = "BattleSkillEditTag",
	target_choise = "TargetShipTag"
}
slot2.arg_list = {
	buff_id = 50015
}
slot1[3] = {
	targetAniEffect = "",
	casterAniEffect = "",
	type = "BattleSkillAddBuff",
	target_choise = "TargetSelf"
}
slot0.effect_list = {}

return {
	uiEffect = "",
	name = "自我维修",
	cd = 0,
	id = 50111,
	picture = "0",
	aniEffect = "",
	desc = "瞬时回复20%血量"
}
