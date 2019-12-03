ys = ys or {}
slot1 = ys.Battle.BattleDataFunction
slot2 = class("BattleSkillSonar", ys.Battle.BattleSkillEffect)
ys.Battle.BattleSkillSonar = slot2
slot2.__name = "BattleSkillSonar"

slot2.Ctor = function (slot0, slot1)
	slot0.super.Ctor(slot0, slot1, lv)

	slot0._range = slot0._tempData.arg_list.range
	slot0._duration = slot0._tempData.arg_list.duration
end

slot2.DoDataEffect = function (slot0, slot1)
	slot1:GetFleetVO():AppendIndieSonar(slot0._range, slot0._duration)
end

slot2.DataEffectWithoutTarget = function (slot0, slot1)
	slot1:GetFleetVO():AppendIndieSonar(slot0._range, slot0._duration)
end

slot2.Clear = function (slot0)
	slot0.super.Clear(slot0)
end

return
