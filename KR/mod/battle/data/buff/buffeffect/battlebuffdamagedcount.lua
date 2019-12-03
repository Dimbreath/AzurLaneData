ys = ys or {}
slot1 = class("BattleBuffDamagedCount", ys.Battle.BattleBuffCount)
ys.Battle.BattleBuffDamagedCount = slot1
slot1.__name = "BattleBuffDamagedCount"

function slot1.Ctor(slot0, slot1)
	slot0.super.Ctor(slot0, slot1)
end

function slot1.onTakeDamage(slot0, slot1, slot2, slot3)
	slot0._count = slot0._count + slot3.damage

	slot0:onTrigger(slot1, slot2)
end

function slot1.onTrigger(slot0, slot1, slot2)
	if slot0._countTarget <= slot0._count then
		slot1:TriggerBuff(slot0.Battle.BattleConst.BuffEffectType.ON_BATTLE_BUFF_COUNT, {
			buffFX = slot0
		})
	end
end

return
