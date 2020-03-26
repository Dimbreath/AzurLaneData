ys = ys or {}
slot1 = class("AutoPilotHiveRelativeStay", ys.Battle.IPilot)
ys.Battle.AutoPilotHiveRelativeStay = slot1
slot1.__name = "AutoPilotHiveRelativeStay"

function slot1.Ctor(slot0, ...)
	slot0.super.Ctor(slot0, ...)
end

function slot1.SetParameter(slot0, slot1, slot2)
	slot0.super.SetParameter(slot0, slot1, slot2)

	slot0._distX = slot1.x
	slot0._distZ = slot1.z
	slot0._duration = slot1.duration
end

function slot1.GetDirection(slot0, slot1)
	if not slot0._pilot:GetHiveUnit():IsAlive() then
		slot0._pilot:OnHiveUnitDead()

		return Vector3.zero
	end

	slot5 = Vector3(slot2:GetPosition().x + slot0._distX, slot1.y, slot2.GetPosition().z + slot0._distZ) - slot1

	if slot0._duration > 0 and slot0._duration < pg.TimeMgr.GetInstance():GetCombatTime() - slot0._startTime then
		slot0:Finish()
	end

	if slot5.magnitude < 0.4 then
		return Vector3.zero
	else
		slot5.y = 0

		return slot5:SetNormalize()
	end
end

return
