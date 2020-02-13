ys = ys or {}
slot1 = ys.Battle.BattleConst
ys.Battle.BattleDepthChargeUnit = class("BattleDepthChargeUnit", ys.Battle.BattleWeaponUnit)
ys.Battle.BattleDepthChargeUnit.__name = "BattleDepthChargeUnit"
slot3 = ys.Battle.BattleTargetChoise

function ys.Battle.BattleDepthChargeUnit.Ctor(slot0)
	slot0.super.Ctor(slot0)
end

function ys.Battle.BattleDepthChargeUnit.TriggerBuffOnFire(slot0)
	slot0._host:TriggerBuff(slot0.BuffEffectType.ON_DEPTH_CHARGE_DROP, {
		equipIndex = slot0._equipmentIndex
	})
end

return
