return {
	uiEffect = "AimEffectUI",
	name = "海伦娜-舰队之眼",
	cd = 0,
	picture = "0",
	aniEffect = "",
	desc = "舰队之眼",
	painting = 1,
	id = 60008,
	effect_list = {
		{
			target_choise = "TargetHarmRandom",
			type = "BattleSkillAddBuff",
			arg_list = {
				buff_id = 60015
			},
			targetAniEffect = {
				effect = "aim",
				posFun = function (slot0, slot1, slot2)
					return Vector3((slot0.x - slot1.x) * (1 - math.min(1, slot2 / 40)), 1 * math.min(1, slot2 / 40), (math.min(1, slot2 / 40) >= 1 and 0) or (slot2 >= 0.8 and (slot0.z - slot1.z + (slot0.x - slot1.x) * (1 - math.min(1, slot2 / 40)) * math.min(1, slot2 / 40)) * (-4 * slot2 + 4)) or (slot2 >= 0.5 and (slot0.z - slot1.z + (slot0.x - slot1.x) * (1 - math.min(1, slot2 / 40)) * math.min(1, slot2 / 40)) * slot2) or (slot0.z - slot1.z + (slot0.x - slot1.x) * (1 - math.min(1, slot2 / 40)) * math.min(1, slot2 / 40)) * (1 - slot2))
				end
			}
		}
	}
}
