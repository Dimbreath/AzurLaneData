ys = ys or {}
slot0 = ys
slot1 = class("AutoPilotStay", slot0.Battle.IPilot)
slot0.Battle.AutoPilotStay = slot1
slot1.__name = "AutoPilotStay"

function slot1.Ctor(slot0, ...)
	uv0.super.Ctor(slot0, ...)
end

function slot1.SetParameter(slot0, slot1, slot2)
	uv0.super.SetParameter(slot0, slot1, slot2)

	slot0._duration = slot1.duration
end

function slot1.GetDirection(slot0)
	if slot0._duration > 0 and slot0._duration < pg.TimeMgr.GetInstance():GetCombatTime() - slot0._startTime then
		slot0:Finish()
	end

	return Vector3.zero
end
