ys = ys or {}
ys.Battle.BattleFleetBuffEffect = class("BattleFleetBuffEffect")
ys.Battle.BattleFleetBuffEffect.__name = "BattleFleetBuffEffect"
slot1 = ys.Battle.BattleUnitEvent

function ys.Battle.BattleFleetBuffEffect.Ctor(slot0, slot1)
	slot0._tempData = Clone(slot1)
	slot0._type = slot0._tempData.type

	slot0:SetActive()
end

function ys.Battle.BattleFleetBuffEffect.SetArgs(slot0, slot1, slot2)
	slot0._fleetVO = slot1
	slot0._fleetBuff = slot2
end

function ys.Battle.BattleFleetBuffEffect.Trigger(slot0, slot1, slot2, slot3, slot4)
	slot0[slot1](slot0, slot2, slot3, slot4)
end

function ys.Battle.BattleFleetBuffEffect.onAttach(slot0, slot1, slot2)
	slot0:onTrigger(slot1, slot2)
end

function ys.Battle.BattleFleetBuffEffect.onRemove(slot0, slot1, slot2)
	slot0:onTrigger(slot1, slot2)
end

function ys.Battle.BattleFleetBuffEffect.onUpdate(slot0, slot1, slot2)
	slot0:onTrigger(slot1, slot2)
end

function ys.Battle.BattleFleetBuffEffect.onStack(slot0, slot1, slot2)
	slot0:onTrigger(slot1, slot2)
end

function ys.Battle.BattleFleetBuffEffect.getTargetList(slot0, slot1, slot2, slot3)
	slot4 = nil
	slot5 = slot1:GetUnitList()[1]

	for slot9, slot10 in ipairs(slot2) do
		slot4 = slot0.Battle.BattleTargetChoise[slot10](slot5, slot3, slot4)
	end

	return slot4
end

function ys.Battle.BattleFleetBuffEffect.IsHappen(slot0, slot1)
	return math.random(100) < slot1
end

function ys.Battle.BattleFleetBuffEffect.IsActive(slot0)
	return slot0._isActive
end

function ys.Battle.BattleFleetBuffEffect.SetActive(slot0)
	slot0._isActive = true
end

function ys.Battle.BattleFleetBuffEffect.NotActive(slot0)
	slot0._isActive = false
end

function ys.Battle.BattleFleetBuffEffect.Clear(slot0)
	return
end

function ys.Battle.BattleFleetBuffEffect.Dispose(slot0)
	return
end

return
