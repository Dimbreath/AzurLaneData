ys = ys or {}
slot1 = ys.Battle.BattleConfig
slot2 = ys.Battle.BattleVariable
ys.Battle.BattleCameraBoundFixDecorate = class("BattleCameraBoundFixDecorate")
ys.Battle.BattleCameraBoundFixDecorate.__name = "BattleCameraBoundFixDecorate"

function ys.Battle.BattleCameraBoundFixDecorate.Ctor(slot0)
	return
end

function ys.Battle.BattleCameraBoundFixDecorate.SetMapData(slot0, slot1, slot2, slot3, slot4)
	slot0._cameraUpperBound = slot1 + 30
	slot0._cameraLowerBound = slot2 - 5
	slot0._cameraLeftBound = slot3 - 3
	slot0._cameraRightBound = slot4 + 3
	slot0._cameraHalfWidth = slot0.CAMERA_SIZE * CameraUtil.AspectRatio
	slot0._cameraLeftBoundPoint = slot0._cameraLeftBound + slot0._cameraHalfWidth
	slot0._cameraRightBoundPoint = slot0._cameraRightBound - slot0._cameraHalfWidth
	slot0._projectionConst = slot0.CAMERA_SIZE / slot1._camera_radian_x_sin
end

function ys.Battle.BattleCameraBoundFixDecorate.GetCameraPos(slot0, slot1)
	slot2 = slot1.y / slot0._camera_radian_x_tan + slot0._projectionConst

	if slot1.z < slot0._cameraLowerBound then
		slot1.z = slot0._cameraLowerBound
	elseif slot1.z > slot0._cameraUpperBound - slot2 then
		slot1.z = slot0._cameraUpperBound - slot2
	end

	if slot1.x < slot0._cameraLeftBoundPoint then
		slot1.x = slot0._cameraLeftBoundPoint
	elseif slot0._cameraRightBoundPoint < slot1.x then
		slot1.x = slot0._cameraRightBoundPoint
	end

	return slot1
end

function ys.Battle.BattleCameraBoundFixDecorate.Dispose(slot0)
	slot0._cameraUpperBound = nil
	slot0._cameraLowerBound = nil
	slot0._cameraLeftBound = nil
	slot0._cameraRightBound = nil
	slot0._cameraHalfWidth = nil
	slot0._cameraLeftBoundPoint = nil
	slot0._cameraRightBoundPoint = nil
	slot0._projectionConst = nil
end

return
