ys = ys or {}
slot1 = class("BattleBuffCount", ys.Battle.BattleBuffEffect)
ys.Battle.BattleBuffCount = slot1
slot1.__name = "BattleBuffCount"

slot1.Ctor = function (slot0, slot1)
	slot0.super.Ctor(slot0, slot1)
end

slot1.SetArgs = function (slot0, slot1, slot2)
	slot0._countTarget = slot0._tempData.arg_list.countTarget or 1
	slot0._countType = slot0._tempData.arg_list.countType
	slot0._weaponType = slot0._tempData.arg_list.weaponType
	slot0._index = slot0._tempData.arg_list.index

	slot0:ResetCount()
end

slot1.onTrigger = function (slot0, slot1, slot2)
	slot0.super.onTrigger(slot0, slot1, slot2)

	slot0._count = slot0._count + 1

	if slot0._countTarget <= slot0._count then
		slot1:TriggerBuff(slot1.Battle.BattleConst.BuffEffectType.ON_BATTLE_BUFF_COUNT, {
			buffFX = slot0
		})
	end
end

slot1.onTakeDamage = function (slot0, slot1, slot2, slot3)
	slot0._count = slot0._count + slot3.damage

	if slot0._countTarget <= slot0._count then
		slot1:TriggerBuff(slot0.Battle.BattleConst.BuffEffectType.ON_BATTLE_BUFF_COUNT, {
			buffFX = slot0
		})
	end
end

slot1.onTakeHealing = function (slot0, slot1, slot2, slot3)
	slot0._count = slot0._count + slot3.damage

	if slot0._countTarget <= slot0._count then
		slot1:TriggerBuff(slot0.Battle.BattleConst.BuffEffectType.ON_BATTLE_BUFF_COUNT, {
			buffFX = slot0
		})
	end
end

slot1.onBulletHit = function (slot0, slot1, slot2, slot3)
	if not slot0:equipIndexRequire(slot3.equipIndex) then
		return
	end

	slot0._count = slot0._count + slot3.damage

	if slot0._countTarget <= slot0._count then
		slot1:TriggerBuff(slot0.Battle.BattleConst.BuffEffectType.ON_BATTLE_BUFF_COUNT, {
			buffFX = slot0
		})
	end
end

slot1.GetCountType = function (slot0)
	return slot0._countType
end

slot1.ResetCount = function (slot0)
	slot0._count = 0
end

return
