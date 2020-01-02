ys = ys or {}
ys.Battle.BattleVariable = ys.Battle.BattleVariable or {}
slot2 = ys or .Battle.BattleConfig

ys or .Battle.BattleVariable.Init = function ()
	slot0.speedRatioByIFF = {
		[0] = 1,
		1,
		[-1.0] = 1
	}
	slot0.focusExemptList = {}
	slot0.MapSpeedRatio = 1
	slot0.MapSpeedFacotrList = {}
	slot0.IFFFactorList = {}

	for slot3, slot4 in pairs(slot0.speedRatioByIFF) do
		slot0.IFFFactorList[slot3] = {}
	end

	slot0._lastCameraPos = nil

	if CameraUtil.AspectRatio <= UnityEngine.Screen.width / UnityEngine.Screen.height then
		slot0._actualWidth = slot1 * slot2
		slot0._actualHeight = slot1
		slot0._leftBottomVector = Vector3(slot4, 0, 0)
		slot0._rightTopVector = Vector3(slot0 - (slot0 - slot0._actualWidth) * 0.5, slot1, 0)
	else
		slot0._actualWidth = slot0
		slot0._actualHeight = slot0 / slot2
		slot0._leftBottomVector = Vector3(0, slot4, 0)
		slot0._rightTopVector = Vector3(slot0, slot1 - (slot1 - slot0._actualHeight) * 0.5, 0)
	end

	slot0._camera = GameObject.Find("MainCamera"):GetComponent(typeof(Camera))
	slot0._cameraTF = slot0._camera.transform
	slot0._uiCamera = GameObject.Find("UICamera"):GetComponent(typeof(Camera))
	slot0._camera_radian_x_sin = math.sin(slot4)
	slot0._camera_radian_x_cos = math.cos(slot4)
	slot0._camera_radian_x_tan = slot0._camera_radian_x_sin / slot0._camera_radian_x_cos
	slot0.CameraNormalHeight = slot0._camera_radian_x_cos * slot1.CAMERA_SIZE + slot1.CAMERA_BASE_HEIGH
	slot0.CameraFocusHeight = slot0._camera_radian_x_cos * slot1.CAST_CAM_ZOOM_SIZE + slot1.CAMERA_BASE_HEIGH
end

ys or .Battle.BattleVariable.Clear = function ()
	slot0.speedRatioByIFF = nil
	slot0.focusExemptList = nil
	slot0.MapSpeedRatio = nil
	slot0.MapSpeedFacotrList = nil
	slot0.IFFFactorList = nil
	slot0._lastCameraPos = nil
	slot0._leftBottomVector = nil
	slot0._rightTopVector = nil
	slot0._camera = nil
	slot0._cameraTF = nil
	slot0._uiCamera = nil
	slot0._camera_radian_x_sin = nil
	slot0._camera_radian_x_cos = nil
	slot0._camera_radian_x_tan = nil
	slot0.CameraNormalHeight = nil
	slot0.CameraFocusHeight = nil
end

slot3 = 0
slot4 = 0
slot5 = 0
slot6 = 0
slot7 = 0
slot8 = 0

ys or .Battle.BattleVariable.UpdateCameraPositionArgs = function ()
	slot1 = slot0._camera.orthographicSize

	if slot0._lastCameraPos == slot0._cameraTF.position and slot0._lastCameraSize == slot1 then
		return
	else
		slot0._lastCameraPos = slot0
		slot0._lastCameraSize = slot1
	end

	slot1 = slot0._camera:ScreenToWorldPoint(slot0._leftBottomVector).x
	slot6 = (slot0._uiCamera:ScreenToWorldPoint(slot0._leftBottomVector).x.y * 0.866 + slot0._uiCamera.ScreenToWorldPoint(slot0._leftBottomVector).x.z * 0.5.y.y - slot0._uiCamera.ScreenToWorldPoint(slot0._leftBottomVector).x.y * 0.866 + slot0._uiCamera.ScreenToWorldPoint(slot0._leftBottomVector).x.z * 0.5.y) / (((slot0._uiCamera:ScreenToWorldPoint(slot0._rightTopVector).x - slot0._uiCamera.ScreenToWorldPoint(slot0._leftBottomVector).x) / (slot0._camera:ScreenToWorldPoint(slot0._rightTopVector).x - slot0._uiCamera.ScreenToWorldPoint(slot0._leftBottomVector).x.x).y * 0.866 + (slot0._uiCamera.ScreenToWorldPoint(slot0._rightTopVector).x - slot0._uiCamera.ScreenToWorldPoint(slot0._leftBottomVector).x) / (slot0._camera.ScreenToWorldPoint(slot0._rightTopVector).x - slot0._uiCamera.ScreenToWorldPoint(slot0._leftBottomVector).x.x).z * 0.5) - (slot0._uiCamera.ScreenToWorldPoint(slot0._leftBottomVector).x.y * 0.866 + slot0._uiCamera.ScreenToWorldPoint(slot0._leftBottomVector).x.z * 0.5))
end

ys or .Battle.BattleVariable.CameraPosToUICamera = function (slot0)
	slot0:CameraPosToUICameraByRef()

	return slot0
end

ys or .Battle.BattleVariable.CameraPosToUICameraByRef = function (slot0)
	slot0.x = (slot0.x - slot0) * () + slot0.x - slot0
	slot0.y = ((slot0.y * 0.866 + slot0.z * 0.5) - slot0.z * 0.5) * slot4 + slot5
	slot0.z = 0
end

ys or .Battle.BattleVariable.AppendMapFactor = function (slot0, slot1)
	if slot0.MapSpeedFacotrList[slot0] ~= nil then
		slot0:RemoveMapFactor()
	end

	slot0.MapSpeedRatio = slot0.MapSpeedRatio * slot1
	slot0.MapSpeedFacotrList[slot0] = slot1
end

ys or .Battle.BattleVariable.RemoveMapFactor = function (slot0)
	if slot0.MapSpeedFacotrList[slot0] ~= nil then
		slot0.MapSpeedRatio = slot0.MapSpeedRatio / slot1
		slot0.MapSpeedFacotrList[slot0] = nil
	end
end

ys or .Battle.BattleVariable.AppendIFFFactor = function (slot0, slot1, slot2)
	if slot0.IFFFactorList[slot0][slot1] ~= nil then
		slot0:RemoveIFFFactor(slot1)
	end

	slot0.speedRatioByIFF[slot0] = slot0.speedRatioByIFF[slot0] * slot2
	slot3[slot1] = slot2
	slot0.focusExemptList = {}
end

ys or .Battle.BattleVariable.RemoveIFFFactor = function (slot0, slot1)
	if slot0.IFFFactorList[slot0][slot1] ~= nil then
		slot0.speedRatioByIFF[slot0] = slot0.speedRatioByIFF[slot0] / slot3
		slot2[slot1] = nil
		slot0.focusExemptList = {}
	end
end

ys or .Battle.BattleVariable.GetSpeedRatio = function (slot0, slot1)
	return slot0.focusExemptList[slot0] or slot0.speedRatioByIFF[slot1]
end

ys or .Battle.BattleVariable.AddExempt = function (slot0, slot1, slot2)
	if slot0.IFFFactorList[slot1][slot2] ~= nil then
		slot0.focusExemptList[slot0] = slot0.speedRatioByIFF[slot1] / slot4
	end
end

return
