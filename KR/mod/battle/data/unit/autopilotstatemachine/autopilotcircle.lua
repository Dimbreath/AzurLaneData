ys = ys or {}
slot1 = Vector3.up
slot2 = class("AutoPilotCircle", ys.Battle.IPilot)
ys.Battle.AutoPilotCircle = slot2
slot2.__name = "AutoPilotCircle"

function slot2.Ctor(slot0, ...)
	slot0.super.Ctor(slot0, ...)
end

function slot2.SetParameter(slot0, slot1, slot2)
	slot0.super.SetParameter(slot0, slot1, slot2)

	slot0._referencePoint = Vector3(slot1.x, 0, slot1.z)
	slot0._radius = slot1.radius
	slot0._duration = slot1.duration

	if slot1.antiClockWise == true then
		slot0.GetDirection = slot0._antiClockWise
	else
		slot0.GetDirection = slot0._clockWise
	end
end

function slot2._clockWise(slot0, slot1)
	if slot0._duration > 0 and slot0._duration < pg.TimeMgr.GetInstance():GetCombatTime() - slot0._startTime then
		slot0:Finish()

		return Vector3.zero
	end

	if slot0._radius < slot1 - slot0._referencePoint.magnitude then
		return slot0._referencePoint - slot1.normalized
	else
		return Vector3(-slot0._referencePoint - slot1.normalized.z, 0, slot0._referencePoint - slot1.normalized.x)
	end
end

function slot2._antiClockWise(slot0, slot1)
	if slot0._duration > 0 and slot0._duration < pg.TimeMgr.GetInstance():GetCombatTime() - slot0._startTime then
		slot0:Finish()

		return Vector3.zero
	end

	if slot0._radius < slot1 - slot0._referencePoint.magnitude then
		return slot0._referencePoint - slot1.normalized
	else
		return Vector3(slot0._referencePoint - slot1.normalized.z, 0, -slot0._referencePoint - slot1.normalized.x)
	end
end

return
