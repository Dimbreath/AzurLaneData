slot1.offset = {
	0,
	-2,
	0
}
slot0.aniEffect = {
	effect = "jineng"
}
slot2.arg_list = {
	weapon_id = 700024
}
slot1[1] = {
	targetAniEffect = "",
	casterAniEffect = "",
	type = "BattleSkillFire",
	target_choise = "TargetNil"
}
slot2.arg_list = {
	buff_id = 8512
}
slot1[2] = {
	targetAniEffect = "",
	casterAniEffect = "",
	type = "BattleSkillAddBuff",
	target_choise = "TargetSelf"
}
slot0.effect_list = {}

return {
	uiEffect = "",
	name = "BOSS每20秒获得吸血buff所有攻击伤害都会转为自身血量持续10秒",
	cd = 0,
	picture = "0",
	desc = "BOSS每20秒获得吸血buff所有攻击伤害都会转为自身血量持续10秒",
	painting = 1,
	id = 90003,
	castCV = "skill"
}
