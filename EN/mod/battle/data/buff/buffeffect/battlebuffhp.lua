ys = ys or {}
slot1 = class("BattleBuffHP", ys.Battle.BattleBuffEffect)
ys.Battle.BattleBuffHP = slot1
slot1.__name = "BattleBuffHP"

function slot1.Ctor(slot0, slot1)
	slot0.super.Ctor(slot0, slot1)
end

function slot1.SetArgs(slot0, slot1, slot2)
	slot0._number = slot0._tempData.arg_list.number or 0
	slot0._numberBase = slot0._number
	slot0._currentHPRatio = 0

	if slot0._tempData.arg_list.currentHPRatio then
		slot0._currentHPRatio = slot0._tempData.arg_list.currentHPRatio * 0.0001
	end

	slot3, slot4 = slot1:GetHP()
	slot5, slot6 = slot0._caster:GetHP()
	slot0._maxHPRatio = slot0._tempData.arg_list.maxHPRatio or 0
	slot0._maxHPNumber = slot4 * slot0._maxHPRatio
	slot0._castMaxHPNumber = 0

	if slot0._tempData.arg_list.casterMaxHPRatio then
		slot0._castMaxHPNumber = slot0._tempData.arg_list.casterMaxHPRatio * 0.0001 * slot6
	end

	slot0._weaponType = slot0._tempData.arg_list.weaponType
	slot0._damageConvert = 0

	if slot0._tempData.arg_list.damageConvertRatio then
		slot0._damageConvert = slot0._tempData.arg_list.damageConvertRatio * 0.0001
	end
end

function slot1.onStack(slot0, slot1, slot2)
	slot0._number = slot0._numberBase * slot2._stack
end

function slot1.onBulletHit(slot0, slot1, slot2, slot3)
	slot4 = slot3.target

	if not slot0._weaponType then
		slot4:UpdateHP(slot0._number, {
			isMiss = false,
			isCri = false,
			isHeal = slot0._number > 0
		})
	elseif slot3.weaponType == slot0._weaponType then
		slot1:UpdateHP(math.floor(slot3.damage * slot0._damageConvert), {
			isMiss = false,
			isCri = false,
			isHeal = true
		})
	end
end

function slot1.onAttach(slot0, slot1, slot2)
	slot1:UpdateHP(slot3, {
		isMiss = false,
		isCri = false,
		isHeal = slot0:CalcNumber(slot1) > 0
	})
end

function slot1.onRemove(slot0, slot1, slot2)
	slot1:UpdateHP(slot3, {
		isMiss = false,
		isCri = false,
		isHeal = slot0:CalcNumber(slot1) > 0
	})
end

function slot1.CalcNumber(slot0, slot1)
	return math.floor((slot1:GetHP() * slot0._currentHPRatio + slot0._maxHPNumber + slot0._number + slot0._castMaxHPNumber) * (slot0._caster:GetAttrByName("healingEnhancement") + 1))
end

return
