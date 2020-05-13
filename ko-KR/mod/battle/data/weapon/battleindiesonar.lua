ys = ys or {}
slot0 = ys
slot1 = slot0.Battle.BattleEvent
slot2 = slot0.Battle.BattleFormulas
slot3 = slot0.Battle.BattleConst
slot4 = slot0.Battle.BattleConfig
slot5 = slot0.Battle.BattleDataFunction
slot6 = slot0.Battle.BattleAttr
slot7 = slot0.Battle.BattleVariable
slot8 = slot0.Battle.BattleTargetChoise
slot9 = class("BattleIndieSonar")
slot0.Battle.BattleIndieSonar = slot9
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

	for slot5, slot6 in ipairs(slot0:FilterTarget()) do
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
	return slot0:FilterRange(uv0.TargetDiveState(slot0._host, {
		diveState = uv1.OXY_STATE.DIVE
	}, uv0.TargetAllFoe(slot0._host)))
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
