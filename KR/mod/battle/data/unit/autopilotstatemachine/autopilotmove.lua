ys = ys or {}
slot1 = class("AutoPilotMove", ys.Battle.IPilot)
ys.Battle.AutoPilotMove = slot1
slot1.__name = "AutoPilotMove"

function slot1.Ctor(slot0, ...)
	slot0.super.Ctor(slot0, ...)
end

function slot1.SetParameter(slot0, slot1, slot2)
	slot0.super.SetParameter(slot0, slot1, slot2)

	slot0._distX = slot1.x
	slot0._distZ = slot1.z
end

function slot1.Active(slot0, slot1)
	slot0._targetPos = Vector3(slot0._distX, 0, slot0._distZ):Add(slot1:GetPosition())

	slot0.super.Active(slot0, slot1)
end

function slot1.GetDirection(slot0, slot1)
	slot0._targetPos - slot1.y = 0

	if slot0._targetPos - slot1.magnitude < slot0._valve then
		slot2 = Vector3.zero

		slot0:Finish()
	end

	return slot2:SetNormalize()
end

return
