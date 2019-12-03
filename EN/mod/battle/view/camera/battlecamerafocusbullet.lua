ys = ys or {}
slot1 = ys.Battle.BattleConfig
slot2 = ys.Battle.BattleVariable
ys.Battle.BattleCameraFocusBulet = class("BattleCameraFocusBulet")
ys.Battle.BattleCameraFocusBulet.__name = "BattleCameraFocusBulet"

function ys.Battle.BattleCameraFocusBulet.Ctor(slot0)
	return
end

function ys.Battle.BattleCameraFocusBulet.SetUnit(slot0, slot1)
	slot0._unit = slot1
end

function ys.Battle.BattleCameraFocusBulet.GetCameraPos(slot0)
	slot1 = slot0._unit:GetPosition():Clone()
	slot1.y = slot1.y + slot0.CameraFocusHeight
	slot1.z = slot1.z - slot1.y / slot0._camera_radian_x_tan

	return slot1
end

function ys.Battle.BattleCameraFocusBulet.Dispose(slot0)
	slot0._unit = nil
end

return
