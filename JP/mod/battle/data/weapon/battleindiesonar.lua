ys = ys or {}
slot1 = ys.Battle.BattleEvent
slot2 = ys.Battle.BattleFormulas
slot3 = ys.Battle.BattleConst
slot4 = ys.Battle.BattleConfig
slot5 = ys.Battle.BattleDataFunction
slot6 = ys.Battle.BattleAttr
slot7 = ys.Battle.BattleVariable
slot8 = ys.Battle.BattleTargetChoise
slot9 = class("BattleIndieSonar")
ys.Battle.BattleIndieSonar = slot9
slot9.__name = "BattleIndieSonar"

function slot9.Ctor(slot0, slot1, slot2, slot3)
	slot0._fleetVO = slot1
	slot0._range = 180
	slot0._duration = slot3
end

function slot9.SwitchHost(slot0, slot1)
	slot0._host = slot1
end

function slot9.Detect(slot0)
	slot0._snoarStartTime = pg.TimeMgr.GetInstance():GetCombatTime()

	for slot5, slot6 in ipairs(slot1) do
		slot6:Detected(slot0._duration)
	end

	slot0._detectedList = slot1

	slot0._fleetVO:DispatchSonarScan(true)
end

function slot9.Update(slot0, slot1)
	if slot1 > slot0._snoarStartTime + slot0._duration then
		for slot5, slot6 in ipairs(slot0._detectedList) do
			if slot6:IsAlive() then
				slot6:Undetected()
			end
		end

		slot0._detectedList = nil

		slot0._fleetVO:RemoveIndieSonar(slot0)
	else
		slot0:updateDetectedList()
	end
end

function slot9.updateDetectedList(slot0)
	slot1 = slot0:FilterTarget()
	slot2 = #slot0._detectedList

	while slot2 > 0 do
		if not slot0._detectedList[slot2]:IsAlive() then
			table.remove(slot0._detectedList, slot2)
		elseif not table.contains(slot1, slot3) then
			slot3:Undetected()
			table.remove(slot0._detectedList, slot2)
		end

		slot2 = slot2 - 1
	end
end

function slot9.FilterTarget(slot0)
	return slot0:FilterRange(slot0.TargetDiveState(slot0._host, {
		diveState = slot1.OXY_STATE.DIVE
	}, slot1))
end

function slot9.FilterRange(slot0, slot1)
	for slot5 = #slot1, 1, -1 do
		if slot0:isOutOfRange(slot1[slot5]) then
			table.remove(slot1, slot5)
		end
	end

	return slot1
end

function slot9.isOutOfRange(slot0, slot1)
	return slot0._range < slot0._host:GetDistance(slot1)
end

return
