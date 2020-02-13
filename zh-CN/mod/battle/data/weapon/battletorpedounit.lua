ys = ys or {}
ys.Battle.BattleTorpedoUnit = class("BattleTorpedoUnit", ys.Battle.BattleWeaponUnit)
ys.Battle.BattleTorpedoUnit.__name = "BattleTorpedoUnit"

function ys.Battle.BattleTorpedoUnit.Ctor(slot0)
	slot0.Battle.BattleTorpedoUnit.super.Ctor(slot0)
end

function ys.Battle.BattleTorpedoUnit.DoAttack(slot0, slot1)
	slot0.Battle.BattleTorpedoUnit.super.DoAttack(slot0, slot1)
end

function ys.Battle.BattleTorpedoUnit.TriggerBuffOnFire(slot0)
	slot0._host:TriggerBuff(slot0.Battle.BattleConst.BuffEffectType.ON_TORPEDO_FIRE, {
		equipIndex = slot0._equipmentIndex
	})
end

function ys.Battle.BattleTorpedoUnit.TriggerBuffWhenSpawn(slot0, slot1)
	slot0._host:TriggerBuff(slot0.Battle.BattleConst.BuffEffectType.ON_BULLET_CREATE, slot2)
	slot0._host:TriggerBuff(slot0.Battle.BattleConst.BuffEffectType.ON_TORPEDO_BULLET_CREATE, {
		_bullet = slot1,
		equipIndex = slot0._equipmentIndex
	})
end

return
