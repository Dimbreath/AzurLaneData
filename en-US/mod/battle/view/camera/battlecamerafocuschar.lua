ys = ys or {}
slot1 = ys.Battle.BattleConfig
slot2 = ys.Battle.BattleVariable
ys.Battle.BattleCameraFocusChar = class("BattleCameraFocusChar")
ys.Battle.BattleCameraFocusChar.__name = "BattleCameraFocusChar"

function ys.Battle.BattleCameraFocusChar.Ctor(slot0)
	slot0._point = Vector3.zero
end

function ys.Battle.BattleCameraFocusChar.SetUnit(slot0, slot1)
	slot0._unit = slot1
end

function ys.Battle.BattleCameraFocusChar.GetCameraPos(slot0)
	slot1 = slot0._unit:GetPosition()

	slot0._point:Set(slot1.x, slot1.y, slot1.z)

	slot0._point.y = slot0._point.y + slot0.CameraFocusHeight
	slot0._point.z = slot0._point.z - slot0._point.y / slot0._camera_radian_x_tan

	if slot0._unit:GetIFF() == slot1.FOE_CODE then
		slot0._point.x = slot0._point.x + 7
	else
		slot0._point.x = slot0._point.x - 7
	end

	return slot0._point
end

function ys.Battle.BattleCameraFocusChar.Dispose(slot0)
	slot0._unit = nil
end

return
