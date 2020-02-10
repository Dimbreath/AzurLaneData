slot1.offset = {
	0,
	-2,
	0
}
slot0.aniEffect = {
	effect = "jineng"
}
slot2.arg_list = {
	weaponType = "TorpedoWeapon"
}
slot1[1] = {
	targetAniEffect = "",
	casterAniEffect = "",
	type = "BattleSkillWeaponFire",
	target_choise = "TargetNil"
}
slot2.arg_list = {
	buff_id = 2160
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
	name = "预备鱼雷",
	cd = 0,
	picture = "0",
	desc = "鱼雷额外1轮",
	painting = 1,
	id = 2161,
	castCV = "skill"
}
