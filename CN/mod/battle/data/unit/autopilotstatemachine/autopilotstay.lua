ys = ys or {}
slot1 = class("AutoPilotStay", ys.Battle.IPilot)
ys.Battle.AutoPilotStay = slot1
slot1.__name = "AutoPilotStay"

slot1.Ctor = function (slot0, ...)
	slot0.super.Ctor(slot0, ...)
end

slot1.SetParameter = function (slot0, slot1, slot2)
	slot0.super.SetParameter(slot0, slot1, slot2)

	slot0._duration = slot1.duration
end

slot1.GetDirection = function (slot0)
	if slot0._duration > 0 and slot0._duration < pg.TimeMgr.GetInstance():GetCombatTime() - slot0._startTime then
		slot0:Finish()
	end

	return Vector3.zero
end

return
