ys = ys or {}
slot1 = class("AutoPilotMoveTo", ys.Battle.IPilot)
ys.Battle.AutoPilotMoveTo = slot1
slot1.__name = "AutoPilotMoveTo"

slot1.Ctor = function (slot0, ...)
	slot0.super.Ctor(slot0, ...)
end

slot1.SetParameter = function (slot0, slot1, slot2)
	slot0.super.SetParameter(slot0, slot1, slot2)

	slot0._targetPos = Vector3(slot1.x, 0, slot1.z)
end

slot1.GetDirection = function (slot0, slot1)
	slot0._targetPos - slot1.y = 0

	if slot0._targetPos - slot1.magnitude < slot0._valve then
		slot2 = Vector3.zero

		slot0:Finish()
	end

	return slot2.normalized
end

return
