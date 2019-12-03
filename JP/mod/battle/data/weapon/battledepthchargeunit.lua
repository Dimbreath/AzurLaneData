ys = ys or {}
slot1 = ys.Battle.BattleConst
ys.Battle.BattleDepthChargeUnit = class("BattleDepthChargeUnit", ys.Battle.BattleWeaponUnit)
ys.Battle.BattleDepthChargeUnit.__name = "BattleDepthChargeUnit"
slot3 = ys.Battle.BattleTargetChoise

ys.Battle.BattleDepthChargeUnit.Ctor = function (slot0)
	slot0.super.Ctor(slot0)
end

ys.Battle.BattleDepthChargeUnit.TriggerBuffOnFire = function (slot0)
	slot0._host:TriggerBuff(slot0.BuffEffectType.ON_DEPTH_CHARGE_DROP, {
		equipIndex = slot0._equipmentIndex
	})
end

return
